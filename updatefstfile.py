import json
from requests_oauthlib import OAuth1Session
def get_weather():
    import requests
    weather_data = requests.get('http://weather.livedoor.com/forecast/webservice/json/v1?city=130010')
    json_weather_data = json.loads(weather_data.text)
    today = json_weather_data["forecasts"][0]["telop"]
    tomorrow  = json_weather_data["forecasts"][1]["telop"]
    return [today, tomorrow]

 # oath_key_dictにconsumer_key、consumer_secret、access_token、access_token_secretを入れてください


def get_tweet():
    tweets = tweet_search("from:TMU_PR", oath_key_dict)
    for tweet in tweets["statuses"]:
        text = tweet['text']
        created_at = tweet['created_at']
    return [text, created_at]

def create_oath_session(oath_key_dict):
    oath = OAuth1Session(
        oath_key_dict["consumer_key"],
        oath_key_dict["consumer_secret"],
        oath_key_dict["access_token"],
        oath_key_dict["access_token_secret"]
    )
    return oath


def tweet_search(search_word, oath_key_dict):
    url = "https://api.twitter.com/1.1/search/tweets.json?"
    params = {
        "q": search_word,
        "lang": "ja",
        "result_type": "recent",
        "count": "1"
    }
    oath = create_oath_session(oath_key_dict)
    responce = oath.get(url, params = params)
    if responce.status_code != 200:
        print("Error code: %d" %(responce.status_code))
        return None
    tweets = json.loads(responce.text)
    return tweets


#UpdataWeatherInfomartion
def update_weather_information():
    today, tomorrow = get_weather()[0], get_weather()[1]
    f = open('MMDagent.fst', encoding='UTF-8')
    l = f.readlines()
    f.close()

    row_num = sarch_row(l, "#weather information\n")
    l[row_num + 2] = "1001 1002 RECOG_EVENT_STOP|今日               SYNTH_START|mei|mei_voice_normal|今日の天気は" + today + "です。\n"
    l[row_num + 3] = "1001 1002 RECOG_EVENT_STOP|明日               SYNTH_START|mei|mei_voice_normal|明日の天気は" + tomorrow + "です。\n"
    f = open('MMDagent.fst', "w", encoding='UTF-8')
    f.writelines(l)
    f.close()


#insertion commma
import MeCab
def insertion_commma(text):
    m = MeCab.Tagger("mecarbrc")
    text = m.parse(text)
    text_list = text.splitlines()

    new_text_list = []
    #print(text_list)
    for i in text_list:
        splitPoint = 10 ** 10
        i = repr(i)
        #print(i)
        for j in range(len(i)):
            if i[j] == "\\":
                splitPoint = j
            if splitPoint < len(i) and i[j] == ",":
                break
        new_text_list.append([i[1:splitPoint], i[splitPoint + 2: j]])
    del new_text_list[-1]

    i = 0
    print(new_text_list)
    commmaText = []
    while i < len(new_text_list):
        if new_text_list[i][0] == "https":
            break
        if new_text_list[i][1] != "記号":
            commmaText.append(new_text_list[i][0])
        if new_text_list[i][1] == "助詞" or new_text_list[i][1] == "接続詞" or new_text_list[i][0] == "、" or new_text_list[i][0] == "。":
            if commmaText[-1] != "," and i < len(new_text_list) - 1:
                if new_text_list[i + 1][1] != "助詞":
                    commmaText.append(",")
        elif new_text_list[i][1] == "名詞" or new_text_list[i][0] == "、" or new_text_list[i][0] == "。":
            if commmaText[-1] != ",":
                commmaText.append("*")
        if new_text_list[i][1] == "記号":
            if len(commmaText) != 0:
                if commmaText[-1] != ",":
                    commmaText.append(",")
        i += 1

    cnt = 0
    for i in range(len(commmaText)):
        if commmaText[i] != "x" and commmaText[i] != ",":
            cnt += len(commmaText[i])
        elif commmaText[i] == ",":
            cnt = 0
        if cnt >= 15:
            j = i
            while j >= 0:
                if commmaText[j] == "*":
                    commmaText[j] = ","
                    break
                j -= 1
            cnt = 0

    text = ""
    for j in range(len(commmaText)):
        i = commmaText[j]
        if i != "*":
            text += i
    print(text)
    return text


#UpdataTweetInformation
def update_tweet_information():
    tweet, created_at = get_tweet()[0], get_tweet()[1]
    tweet = tweet.replace("\n"," ")
    f = open('MMDagent.fst', encoding='UTF-8')
    l = f.readlines()
    f.close()
    tweet = insertion_commma(tweet)
    row_num = sarch_row(l, "#twitter information\n")
    l[row_num + 2] = "601  602  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|" + tweet + "\n"
    f = open('MMDagent.fst', "w", encoding='UTF-8')
    f.writelines(l)
    f.close()


def sarch_row(fst_list, keyword):
    cnt = 0
    for i in fst_list:
        if i == keyword:
            return cnt
        cnt += 1

update_tweet_information()
update_weather_information()
