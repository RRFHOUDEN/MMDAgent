# ----------------------------------------------------------------- #
#           MMDAgent "Sample Script"                                #
#           released by MMDAgent Project Team                       #
#           http://www.mmdagent.jp/                                 #
# ----------------------------------------------------------------- #
#                                                                   #
#  Copyright (c) 2009-2015  Nagoya Institute of Technology          #
#                           Department of Computer Science          #
#                                                                   #
# Some rights reserved.                                             #
#                                                                   #
# This work is licensed under the Creative Commons Attribution 3.0  #
# license.                                                          #
#                                                                   #
# You are free:                                                     #
#  * to Share - to copy, distribute and transmit the work           #
#  * to Remix - to adapt the work                                   #
# Under the following conditions:                                   #
#  * Attribution - You must attribute the work in the manner        #
#    specified by the author or licensor (but not in any way that   #
#    suggests that they endorse you or your use of the work).       #
# With the understanding that:                                      #
#  * Waiver - Any of the above conditions can be waived if you get  #
#    permission from the copyright holder.                          #
#  * Public Domain - Where the work or any of its elements is in    #
#    the public domain under applicable law, that status is in no   #
#    way affected by the license.                                   #
#  * Other Rights - In no way are any of the following rights       #
#    affected by the license:                                       #
#     - Your fair dealing or fair use rights, or other applicable   #
#       copyright exceptions and limitations;                       #
#     - The author's moral rights;                                  #
#     - Rights other persons may have either in the work itself or  #
#       in how the work is used, such as publicity or privacy       #
#       rights.                                                     #
#  * Notice - For any reuse or distribution, you must make clear to #
#    others the license terms of this work. The best way to do this #
#    is with a link to this web page.                               #
#                                                                   #
# See http://creativecommons.org/ for details.                      #
# ----------------------------------------------------------------- #

# 1st field: state before transition
# 2nd field: state after transition
# 3rd field: event (input message)
# 4th field: command (output message)
#
# Model
# MODEL_ADD|(model alias)|(model file name)|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(ON or OFF for cartoon)|(parent model alias)|(parent bone name)
# MODEL_CHANGE|(model alias)|(model file name)
# MODEL_DELETE|(model alias)
# MODEL_EVENT_ADD|(model alias)
# MODEL_EVENT_CHANGE|(model alias)
# MODEL_EVENT_DELETE|(model alias)
#
# Motion
# MOTION_ADD|(model alias)|(motion alias)|(motion file name)|(FULL or PART)|(ONCE or LOOP)|(ON or OFF for smooth)|(ON or OFF for repos)
# MOTION_ACCELERATE|(model alias)|(motion alias)|(speed)|(duration)|(specified time for end)
# MOTION_CHANGE|(model alias)|(motion alias)|(motion file name)
# MOTION_DELETE|(mpdel alias)|(motion alias)
# MOTION_EVENT_ADD|(model alias)|(motion alias)
# MOTION_EVENT_ACCELERATE|(model alias)|(motion alias)
# MOTION_EVENT_CHANGE|(model alias)|(motion alias)
# MOTION_EVENT_DELETE|(model alias)|(motion alias)
#
# Move and Rotate
# MOVE_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(move speed)
# MOVE_STOP|(model alias)
# MOVE_EVENT_START|(model alias)
# MOVE_EVENT_STOP|(model alias)
# TURN_START|(model alias)|(x position),(y position),(z position)|(GLOBAL or LOCAL position)|(rotation speed)
# TURN_STOP|(model alias)
# TURN_EVENT_START|(model alias)
# TURN_EVENT_STOP|(model alias)
# ROTATE_START|(model alias)|(x rotation),(y rotaion),(z rotation)|(GLOBAL or LOCAL rotation)|(rotation speed)
# ROTATE_STOP|(model alias)
# ROTATE_EVENT_START|(model alias)
# ROTATE_EVENT_STOP|(model alias)
#
# Sound
# SOUND_START|(sound alias)|(sound file name)
# SOUND_STOP|(sound alias)
# SOUND_EVENT_START|(sound alias)
# SOUND_EVENT_STOP|(sound alias)
#
# Stage
# STAGE|(stage file name)
# STAGE|(bitmap file name for floor),(bitmap file name for background)
#
# Light
# LIGHTCOLOR|(red),(green),(blue)
# LIGHTDIRECTION|(x position),(y position),(z position)
#
# Camera
# CAMERA|(x position),(y position),(z position)|(x rotation),(y rotation),(z rotation)|(distance)|(fovy)|(time)
# CAMERA|(motion file name)
#
# Speech recognition
# RECOG_EVENT_START
# RECOG_EVENT_STOP|(word sequence)
# RECOG_MODIFY|GAIN|(ratio)
# RECOG_MODIFY|USERDICT_SET|(dictionary file name)
# RECOG_MODIFY|USERDICT_UNSET
# RECOG_MODIFY|CHANGE_CONF|(config file name)
#
# Speech synthesis
# SYNTH_START|(model alias)|(voice alias)|(synthesized text)
# SYNTH_STOP|(model alias)
# SYNTH_EVENT_START|(model alias)
# SYNTH_EVENT_STOP|(model alias)
# LIPSYNC_START|(model alias)|(phoneme and millisecond pair sequence)
# LIPSYNC_STOP|(model alias)
# LIPSYNC_EVENT_START|(model alias)
# LIPSYNC_EVENT_STOP|(model alias)
#
# Variable
# VALUE_SET|(variable alias)|(value)
# VALUE_SET|(variable alias)|(minimum value for random)|(maximum value for random)
# VALUE_UNSET|(variable alias)
# VALUE_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)
# VALUE_EVENT_SET|(variable alias)
# VALUE_EVENT_UNSET|(variable alias)
# VALUE_EVENT_EVAL|(variable alias)|(EQ or NE or LE or LT or GE or GT for evaluation)|(value)|(TRUE or FALSE)
# TIMER_START|(count down alias)|(value)
# TIMER_STOP|(count down alias)
# TIMER_EVENT_START|(count down alias)
# TIMER_EVENT_STOP|(count down alias)
#
# Plugin
# PLUGIN_ENABLE|(plugin name)
# PLUGIN_DISABLE|(plugin name)
# PLUGIN_EVENT_ENABLE|(plugin name)
# PLUGIN_EVENT_DISABLE|(plugin name)
#
# Other events
# DRAGANDDROP|(file name)
# KEY|(key name)
#
# Other commands
# EXECUTE|(file name)
# KEY_POST|(window class name)|(key name)|(ON or OFF for shift-key)|(ON or OFF for ctrl-key)|(On or OFF for alt-key)

# 0011-0020 Initialization

0    11   <eps>                               MODEL_ADD|bootscreen|Accessory\bootscreen\bootscreen.pmd|0.0,12.85,17.6|0.0,0.0,0.0|OFF
11   12   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\2018_c2_3dmodel\TMUboyv113.pmd|0.0,0.0,-14.0
12   13   <eps>                               MODEL_ADD|menu|Accessory\menu1\menu.pmd|0.0,-2,0.0|0.0,0.0,0.0|ON|mei
13   14   <eps>                               VALUE_SET|text_idle_value|1
14   15   VALUE_EVENT_SET|text_idle_value     STAGE|Stage\stage\stage115.pmd
15   16   <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
16   17   <eps>                               TIMER_START|bootscreen|1.5
17   18   <eps>				      EXECUTE|updatefstfile.exe
18   19   TIMER_EVENT_STOP|bootscreen         MODEL_DELETE|bootscreen
19   20   <eps>                               TEXTAREA_ADD|caption|50,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|0,3,-2
20   2000   TEXTAREA_EVENT_ADD|caption        TEXTAREA_SET|caption|"「天気」、「首都大のTwitter」、「ひま」、「あるある」以外にもわかる言葉はあるので話しかけてください♪"
2000 2001   <eps>                             TEXTAREA_ADD|hyouzi|20,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|15,25,-2
2001    2   TEXTAREA_EVENT_ADD|hyouzi         TEXTAREA_SET|hyouzi|"aを押すと反応する言葉一覧が見えます。"

# 0021-0030 Idle behavior

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   24   TIMER_EVENT_START|idle3             TIMER_START|text_idle|6
24   1    TIMER_EVENT_START|text_idle         VALUE_SET|random|0|100                      
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    2    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|しゅーとと言います。
1    41   RECOG_EVENT_STOP|自己               SYNTH_START|mei|mei_voice_normal|しゅーとと言います。
1    41   RECOG_EVENT_STOP|紹介               SYNTH_START|mei|mei_voice_normal|しゅーとと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|しゅーとと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|しゅーとと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|20
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|20
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|20
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|20
61   62   VALUE_EVENT_EVAL|random|LE|20|TRUE  SYNTH_START|mei|mei_voice_normal|恥ずかしいです。
61   62   VALUE_EVENT_EVAL|random|LE|20|FALSE SYNTH_START|mei|mei_voice_normal|ありがとう。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0091-0100 Bye

1    91   RECOG_EVENT_STOP|バイバイ           SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さようなら         SYNTH_START|mei|mei_voice_normal|さようなら。
1    91   RECOG_EVENT_STOP|さよなら           SYNTH_START|mei|mei_voice_normal|さようなら。
91   92   <eps>                               MOTION_ADD|mei|action|Motion\mei_bye\mei_bye.vmd|PART|ONCE
92   2    SYNTH_EVENT_STOP|mei                <eps>

# 0101-0110 Browsing

1    101  KEY|2     			      EXECUTE|http://www.mmdagent.jp/
1    101  RECOG_EVENT_STOP|ＭＭＤＡｇｅｎｔ   EXECUTE|http://www.mmdagent.jp/
101  102  <eps>                               SYNTH_START|mei|mei_voice_normal|ＭＭＤＡｇｅｎｔの、ホームページを表示します。
102  2    SYNTH_EVENT_STOP|mei                <eps>

# 0111-0120 Screen

1    111  RECOG_EVENT_STOP|フルスクリーン     KEY_POST|MMDAgent|F|OFF
111  112  <eps>                               SYNTH_START|mei|mei_voice_normal|スクリーンの設定を、変更しました。
112  2    SYNTH_EVENT_STOP|mei                <eps>

# 0121-0130 English example

1    121  RECOG_EVENT_STOP|はじめまして       "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
1    121  RECOG_EVENT_STOP|はじめ             "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
1    121  RECOG_EVENT_STOP|始め               "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
1    121  RECOG_EVENT_STOP|初め               "SYNTH_START|mei|slt_voice_normal|Hello, nice to meet you."
121  2    SYNTH_EVENT_STOP|mei                <eps>


# 0141-0400 1mon1tou
1    141   RECOG_EVENT_STOP|ひま               MODEL_DELETE|menu
1    141   RECOG_EVENT_STOP|暇                 MODEL_DELETE|menu
1    141   KEY|1                               MODEL_DELETE|menu
141  142   MODEL_EVENT_DELETE|menu             TEXTAREA_DELETE|hyouzi
142  143   <eps>                               TEXTAREA_SET|caption|"質問をはじめるよ。それじゃあ、今のあなたの気分でのおすすめの暇つぶしスポットを教えちゃうよ！今から私がする質問に、はいかいいえで答えてね！じゃあはじめるよ！" 
143  150   <eps>                               SYNTH_START|mei|mei_voice_normal|質問をはじめるよお。それじゃあ、今のあなたの気分でのおすすめの暇つぶしスポットを教えちゃうよ！今から私がする質問に、はいかいいえで答えてね！じゃあはじめるよ！

150  151   SYNTH_EVENT_STOP|mei                TEXTAREA_SET|caption|"質問1、今日はちゃんと朝ごはんを食べてきましたか？"
151  152   <eps>                               MODEL_ADD|yes|Accessory\yes_no\yes1.pmd|-10,13,0
152  153   <eps>                               MODEL_ADD|no|Accessory\yes_no\no1.pmd|9,13,0
153  154   <eps>                               SYNTH_START|mei|mei_voice_normal|質問1、今日はちゃんと朝ごはんを食べてきましたか？ 
154  155   RECOG_EVENT_STOP|はい               VALUE_SET|x|1
154  155   KEY|1                               VALUE_SET|x|1                             
155  160   <eps>                               MOTION_ADD|mei|action1|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE

154  156   RECOG_EVENT_STOP|いいえ             VALUE_SET|x|0
154  156   KEY|2                               VALUE_SET|x|0
156  160   <eps>                               MOTION_ADD|mei|action1|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

160  161   <eps>         		       TEXTAREA_SET|caption|"質問2、値段より質？"
161  162   <eps>                               SYNTH_START|mei|mei_voice_normal|質問2、値段より質？
162  163   RECOG_EVENT_STOP|はい               VALUE_EVAL|x|EQ|1
162  163   KEY|1                               VALUE_EVAL|x|EQ|1
163  164   VALUE_EVENT_EVAL|x|EQ|1|TRUE        VALUE_SET|x|2
163  164   VALUE_EVENT_EVAL|x|EQ|1|FALSE       VALUE_SET|x|1
164  170   <eps>                               MOTION_ADD|mei|action2|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE

162  165   RECOG_EVENT_STOP|いいえ             <eps>
162  165   KEY|2                               <eps>
165  170   <eps>                               MOTION_ADD|mei|action2|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

170  171   <eps>         		       TEXTAREA_SET|caption|"質問3、そういえば、おなかが減ってきたなぁ。"
171  172   <eps>                               SYNTH_START|mei|mei_voice_normal|質問3、そういえば、おなかが減ってきたなぁ。
172  173   RECOG_EVENT_STOP|はい               VALUE_EVAL|x|EQ|2
172  173   KEY|1                               VALUE_EVAL|x|EQ|2
173  175   VALUE_EVENT_EVAL|x|EQ|2|TRUE        VALUE_SET|x|3
173  174   VALUE_EVENT_EVAL|x|EQ|2|FALSE       VALUE_EVAL|x|EQ|1
174  175   VALUE_EVENT_EVAL|x|EQ|1|TRUE        VALUE_SET|x|2
174  175   VALUE_EVENT_EVAL|x|EQ|1|FALSE       VALUE_SET|x|1
175  180   <eps>                               MOTION_ADD|mei|action3|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE
172  176   RECOG_EVENT_STOP|いいえ             <eps>
172  176   KEY|2                               <eps>
176  180   <eps>                               MOTION_ADD|mei|action3|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

180  181   <eps>         		       TEXTAREA_SET|caption|"質問4、一人でも全然オッケー。"
181  182   <eps>			       SYNTH_START|mei|mei_voice_normal|質問4、一人でも全然オッケー。			       
182  183   RECOG_EVENT_STOP|はい	       VALUE_SET|y|1
182  183   KEY|1			       VALUE_SET|y|1
183  190   <eps>                               MOTION_ADD|mei|action4|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE
182  184   RECOG_EVENT_STOP|いいえ             VALUE_SET|y|0
182  184   KEY|2			       VALUE_SET|y|0
184  190   <eps>                               MOTION_ADD|mei|action4|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

190  191   <eps>         		       TEXTAREA_SET|caption|"質問5、立っているの、疲れたな。"
191  192   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問5、立っているの、疲れたな。
192  193   RECOG_EVENT_STOP|はい               VALUE_EVAL|y|EQ|1
192  193   KEY|1			       VALUE_EVAL|y|EQ|1
193  194   VALUE_EVENT_EVAL|y|EQ|1|TRUE        VALUE_SET|y|2
193  194   VALUE_EVENT_EVAL|y|EQ|1|FALSE       VALUE_SET|y|1
194  200   <eps>                               MOTION_ADD|mei|action5|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE
192  195   RECOG_EVENT_STOP|いいえ             <eps>
192  195   KEY|2			       <eps>
195  200   <eps>                               MOTION_ADD|mei|action5|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

200  201   <eps>         		       TEXTAREA_SET|caption|"質問6、広いところより狭いところの方が落ち着くよね。"
201  202   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問6、広いところより狭いところの方が落ち着くよね。
202  203   RECOG_EVENT_STOP|はい               VALUE_EVAL|y|EQ|2
202  203   KEY|1			       VALUE_EVAL|y|EQ|2
203  205   VALUE_EVENT_EVAL|y|EQ|2|TRUE        VALUE_SET|y|3
203  204   VALUE_EVENT_EVAL|y|EQ|2|FALSE       VALUE_EVAL|y|EQ|1
204  205   VALUE_EVENT_EVAL|y|EQ|1|TRUE        VALUE_SET|y|2
204  205   VALUE_EVENT_EVAL|y|EQ|1|FALSE       VALUE_SET|y|1
205  210   <eps>                               MOTION_ADD|mei|action6|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE
202  206   RECOG_EVENT_STOP|いいえ             <eps>
202  206   KEY|2                               <eps>
206  210   <eps>                               MOTION_ADD|mei|action6|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

210  211   <eps>         		       TEXTAREA_SET|caption|"質問7、テスト期間、そろそろじゃない？"
211  212   <eps>			       SYNTH_START|mei|mei_voice_normal|質問7、テスト期間、そろそろじゃない？			       
212  213   RECOG_EVENT_STOP|はい	       VALUE_SET|z|1
212  213   KEY|1			       VALUE_SET|z|1
213  220   <eps>                               MOTION_ADD|mei|action7|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE
212  214   RECOG_EVENT_STOP|いいえ             VALUE_SET|z|0
212  214   KEY|2			       VALUE_SET|z|0
214  220   <eps>                               MOTION_ADD|mei|action7|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

220  221   <eps>         		       TEXTAREA_SET|caption|"質問8、最近授業中よく寝ちゃうんだよなぁ。"
221  222   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問8、最近授業中よく寝ちゃうんだよなぁ。
222  223   RECOG_EVENT_STOP|はい               VALUE_EVAL|z|EQ|1
222  223   KEY|1			       VALUE_EVAL|z|EQ|1
223  224   VALUE_EVENT_EVAL|z|EQ|1|TRUE        VALUE_SET|z|2
223  224   VALUE_EVENT_EVAL|z|EQ|1|FALSE       VALUE_SET|z|1
224  230   <eps>                               MOTION_ADD|mei|action8|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE
222  225   RECOG_EVENT_STOP|いいえ             <eps>
222  225   KEY|2			       <eps>
225  230   <eps>                               MOTION_ADD|mei|action8|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE

230  231   <eps>                               TEXTAREA_SET|caption|"質問9、あなた、今勉強したいんじゃない？"
231  232   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問9、あなた、今勉強したいんじゃない？
232  233   RECOG_EVENT_STOP|はい               VALUE_EVAL|z|EQ|2
232  233   KEY|1			       VALUE_EVAL|z|EQ|2
233  235   VALUE_EVENT_EVAL|z|EQ|2|TRUE        VALUE_SET|z|3
233  234   VALUE_EVENT_EVAL|z|EQ|2|FALSE       VALUE_EVAL|z|EQ|1
234  235   VALUE_EVENT_EVAL|z|EQ|1|TRUE        VALUE_SET|z|2
234  235   VALUE_EVENT_EVAL|z|EQ|1|FALSE       VALUE_SET|z|1
235  240   <eps>                               MOTION_ADD|mei|action9|Motion\mei_point\mei_point_right_top.vmd|PART|ONCE
232  236   RECOG_EVENT_STOP|いいえ             <eps>
232  236   KEY|2			       <eps>
236  240   <eps>                               MOTION_ADD|mei|action9|Motion\mei_point\mei_point_lef_top.vmd|PART|ONCE


240  268    <eps>                               MODEL_DELETE|yes
268  310    <eps>                               MODEL_DELETE|no

310  311   MODEL_EVENT_DELETE|no               VALUE_EVAL|x|GE|2
311  312   VALUE_EVENT_EVAL|x|GE|2|TRUE        VALUE_EVAL|y|GE|2
312  313   VALUE_EVENT_EVAL|y|GE|2|TRUE        VALUE_EVAL|z|GE|2
313  350   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|そうね、たしかキャンパスの近くにサイゼリヤがあったはずだわ。たしかこのあたりよ。ここなら勉強をしながら食事もできるし、今のあなたにはいいんじゃないかしら。
350  335   <eps>                               TEXTAREA_SET|caption|"そうね、たしかキャンパスの近くにサイゼリヤがあったはずだわ。たしかこのあたりよ。ここなら勉強をしながら食事もできるし、今のあなたにはいいんじゃないかしら。\n（「おわり」と話すと、スタート画面に戻ります！）"
313  351   VALUE_EVENT_EVAL|z|GE|2|FALSE       SYNTH_START|mei|mei_voice_normal|ちかくのコンビににいってみてはどうかしら。あそこって意外とうちのだいがくのひとがこない穴場なのよ。
351  330   <eps>                               TEXTAREA_SET|caption|"ちかくのコンビ二にいってみてはどうかしら。あそこって意外とうちの大学のひとがこない穴場なのよ。\n（「おわり」と話すと、スタート画面に戻ります！）"
312  314   VALUE_EVENT_EVAL|y|GE|2|FALSE       VALUE_EVAL|z|GE|2
314  352   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|がくしょくにいきましょう。みんなで今週の課題の話でもしてみてはどうかしら。
352  330   <eps>                               TEXTAREA_SET|caption|"学食にいきましょう。みんなで今週の課題の話でもしてみてはどうかしら。\n（「おわり」と話すと、スタート画面に戻ります！）"  
314  353   VALUE_EVENT_EVAL|z|GE|2|FALSE       SYNTH_START|mei|mei_voice_normal|すこしとよだ駅のほうに歩いていくと、ぜんや、というお弁当屋さんがあるわ。あそこのお弁当、安くておいしいから私はとてもすきなの。
353  330   <eps>                               TEXTAREA_SET|caption|"すこしとよだ駅のほうに歩いていくと、ぜんや、というお弁当屋さんがあるわ。あそこのお弁当、安くておいしいから私はとてもすきなの。\n（「おわり」と話すと、スタート画面に戻ります！）"

311  315   VALUE_EVENT_EVAL|x|GE|2|FALSE       VALUE_EVAL|y|GE|2
315  316   VALUE_EVENT_EVAL|y|GE|2|TRUE        VALUE_EVAL|z|GE|2
316  360   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|図書館に行って勉強するっていうのはどうかしら。うちの大学の図書館はとても静かだから、私もよく勉強するときはあそこにいくわ。
360  330   <eps>                               TEXTAREA_SET|caption|"図書館に行って勉強するっていうのはどうかしら。うちの大学の図書館はとても静かだから、私もよく勉強するときはあそこにいくわ。\n（「おわり」と話すと、スタート画面に戻ります！）"
316  361   VALUE_EVENT_EVAL|z|GE|2|FALSE       SYNTH_START|mei|mei_voice_normal|二号館の二階の、こうどう前のすぺーすって、イベントとかのない日はほんとに誰も来ないのよ。次の授業まであそこの机でひとやすみしませんか。
361  330   <eps>                               TEXTAREA_SET|caption|"二号館の二階の、こうどう前のすぺーすって、イベントとかのない日はほんとに誰も来ないのよ。次の授業まであそこの机でひとやすみしませんか。\n（「おわり」と話すと、スタート画面に戻ります！）"
315  317   VALUE_EVENT_EVAL|y|GE|2|FALSE       VALUE_EVAL|z|GE|2
317  362   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|次の授業の教室に行ってみませんか？この前の授業でわからなかったところを、誰かに聞けるかもしれませんよ。
362  330   <eps>                               TEXTAREA_SET|caption|"次の授業の教室に行ってみませんか？この前の授業でわからなかったところを、誰かに聞けるかもしれませんよ。\n（「おわり」と話すと、スタート画面に戻ります！）" 
317  320   VALUE_EVENT_EVAL|z|GE|2|FALSE       VALUE_EVAL|x|EQ|1
320  321   VALUE_EVENT_EVAL|x|EQ|1|TRUE        VALUE_EVAL|y|EQ|1
321  322   VALUE_EVENT_EVAL|y|EQ|1|TRUE        VALUE_EVAL|z|EQ|1
322  363   VALUE_EVENT_EVAL|z|EQ|1|TRUE        SYNTH_START|mei|mei_voice_normal|そうですね、もしよければ私とはなしでもしませんか？じつはちょうど私もひまだったのです。
363  330   <eps>                               TEXTAREA_SET|caption|"そうですね、もしよければ私とはなしでもしませんか？じつはちょうど私もひまだったのです。\n（「おわり」と話すと、スタート画面に戻ります！）" 
322  364   VALUE_EVENT_EVAL|z|EQ|1|FALSE       SYNTH_START|mei|mei_voice_normal|研究室にすこしかおを出してみてはどうでしょうか。誰かいるかもしれませんよ。
364  330   <eps>                               TEXTAREA_SET|caption|"研究室にすこしかおを出してみてはどうでしょうか。誰かいるかもしれませんよ。\n（「おわり」と話すと、スタート画面に戻ります！）"

321  323   VALUE_EVENT_EVAL|y|EQ|1|FALSE       VALUE_EVAL|z|EQ|1
323  365   VALUE_EVENT_EVAL|z|EQ|1|TRUE        SYNTH_START|mei|mei_voice_normal|本でも読んでみてはいかがですか。わたしはこのまえ図書館で、もりみとみひこ、という方のかいた、夜行、という本をよんだの。面白かったからおすすめしておくわね。
365  330   <eps>                               TEXTAREA_SET|caption|"本でも読んでみてはいかがですか。わたしはこのまえ図書館で、もりみとみひこ、という方のかいた、夜行、という本をよんだの。面白かったからおすすめしておくわね。\n（「おわり」と話すと、スタート画面に戻ります！）" 
323  366   VALUE_EVENT_EVAL|z|EQ|1|FALSE       SYNTH_START|mei|mei_voice_normal|ひましてそうな友達に電話をしてみましょうよ。わたしもともだちと電話って、一度してみたいものです
366  330   <eps>                               TEXTAREA_SET|caption|"ひましてそうな友達に電話をしてみましょうよ。わたしもともだちと電話って、一度してみたいものです。\n（「おわり」と話すと、スタート画面に戻ります！）" 

320  324   VALUE_EVENT_EVAL|x|EQ|1|FALSE       VALUE_EVAL|y|EQ|1
324  325   VALUE_EVENT_EVAL|y|EQ|1|TRUE        VALUE_EVAL|z|EQ|1
325  370   VALUE_EVENT_EVAL|z|EQ|1|TRUE        SYNTH_START|mei|mei_voice_normal|気分転換にだれかさそってカラオケでも行きましょう！え、次の授業ですって？それは・・・ふふふふ。
370  330   <eps>                               TEXTAREA_SET|caption|"気分転換にだれかさそってカラオケでも行きましょう！え、次の授業ですって？それは・・・ふふふふ。\n（「おわり」と話すと、スタート画面に戻ります！）" 
325  371   VALUE_EVENT_EVAL|z|EQ|1|FALSE       SYNTH_START|mei|mei_voice_normal|たしかキャンパスの近くにマクドナルドがあったはずだわ。たしかこのあたりよ。すこしなにかたべて、お友達と宿題の話でもしましょうよ
371  335   <eps>                               TEXTAREA_SET|caption|"たしかキャンパスの近くにマクドナルドがあったはずだわ。たしかこのあたりよ。すこしなにかたべて、お友達と宿題の話でもしましょうよ\n（「おわり」と話すと、スタート画面に戻ります！）" 

324  326   VALUE_EVENT_EVAL|y|EQ|1|FALSE       VALUE_EVAL|z|EQ|1
326  372   VALUE_EVENT_EVAL|z|EQ|1|TRUE        SYNTH_START|mei|mei_voice_normal|きょうはおうちにかえりましょう。そんな日もたまには必要です。
372  330   <eps>                               TEXTAREA_SET|caption|"きょうはおうちにかえりましょう。そんな日もたまには必要です。\n（「おわり」と話すと、スタート画面に戻ります！）" 
326  373   VALUE_EVENT_EVAL|z|EQ|1|FALSE       SYNTH_START|mei|mei_voice_normal|とりあえず次の授業の教室にいっておきましょう。あ、その前に購買でおかしでも買ってきてはどうですか？
373  330   <eps>                               TEXTAREA_SET|caption|"とりあえず次の授業の教室にいっておきましょう。あ、その前に購買でおかしでも買ってきてはどうですか？\n（「おわり」と話すと、スタート画面に戻ります！）" 


330  390   RECOG_EVENT_STOP|おわり             MODEL_ADD|menu|Accessory\menu1\menu.pmd|0.0,-2,0.0|0.0,0.0,0.0|ON|mei

335  336   <eps>                               TEXTAREA_ADD|map|20,20|1,1,1|1,1,1,0|0,0,0,0|-13,15,0
336  337   TEXTAREA_EVENT_ADD|map              TEXTAREA_SET|map|image\map1.png
337  338   RECOG_EVENT_STOP|おわり             TEXTAREA_DELETE|map
338  390   TEXTAREA_EVENT_DELETE|map           MODEL_ADD|menu|Accessory\menu1\menu.pmd|0.0,-2,0.0|0.0,0.0,0.0|ON|mei

390  391   <eps>                             TEXTAREA_ADD|hyouzi|20,-1|1.2,1,1|1,1,1,0.7|0,0,0,1|15,25,-2
391    2   TEXTAREA_EVENT_ADD|hyouzi         TEXTAREA_SET|hyouzi|"aを押すと反応する言葉一覧が見えます。"


# 0401-0450 aruaru
1    401   RECOG_EVENT_STOP|あるある            VALUE_SET|x|0|4
1    401   RECOG_EVENT_STOP|ある                VALUE_SET|x|0|4
401  402   VALUE_EVENT_SET|x                    VALUE_EVAL|x|LE|1
402  412   VALUE_EVENT_EVAL|x|LE|1|TRUE         TEXTAREA_SET|caption|"大学名記入時の困惑。"
412  450   <eps>                                SYNTH_START|mei|mei_voice_normal|大学名記入時の困惑。
402  403   VALUE_EVENT_EVAL|x|LE|1|FALSE        VALUE_EVAL|x|LE|2
403  413   VALUE_EVENT_EVAL|x|LE|2|TRUE         TEXTAREA_SET|caption|"24時間いつでも使える研究室最高。"
413  450   <eps>                                SYNTH_START|mei|mei_voice_normal|24時間いつでも使える研究室最高。 
403  404   VALUE_EVENT_EVAL|x|LE|2|FALSE        VALUE_EVAL|x|LE|3
404  414   VALUE_EVENT_EVAL|x|LE|3|TRUE         TEXTAREA_SET|caption|"エレベーターが混んでいて階段で歩く。"
414  450   <eps>                                SYNTH_START|mei|mei_voice_normal|エレベーターが混んでいて階段で歩く。
404  415   VALUE_EVENT_EVAL|x|LE|3|FALSE        TEXTAREA_SET|caption|"夜の首都大は綺麗。"
415  450   <eps>                                SYNTH_START|mei|mei_voice_normal|夜の首都大は綺麗。
450   2    SYNTH_EVENT_STOP|mei                <eps>


# 501-530 menu画面での機能紹介
1   501  TIMER_EVENT_STOP|text_idle                   VALUE_EVAL|text_idle_value|EQ|1
501 502  VALUE_EVENT_EVAL|text_idle_value|EQ|1|TRUE   TEXTAREA_SET|caption|"「天気」では、今日の天気や明日の天気をお伝えします。"
502   2  TEXTAREA_EVENT_SET|caption                   VALUE_SET|text_idle_value|2
501 503  VALUE_EVENT_EVAL|text_idle_value|EQ|1|FALSE  VALUE_EVAL|text_idle_value|EQ|2
503 504  VALUE_EVENT_EVAL|text_idle_value|EQ|2|TRUE   TEXTAREA_SET|caption|"「首都大のTwitter」では、首都大学公式Twitterのツイートをお伝えします。"
504   2  TEXTAREA_EVENT_SET|caption                   VALUE_SET|text_idle_value|3
503 505  VALUE_EVENT_EVAL|text_idle_value|EQ|2|FALSE  VALUE_EVAL|text_idle_value|EQ|3
505 506  VALUE_EVENT_EVAL|text_idle_value|EQ|3|TRUE   TEXTAREA_SET|caption|"「ひま」では、いくつかの質問から、あなたにぴったりな空き時間の過ごし方を提案させていただきます。"
506   2  TEXTAREA_EVENT_SET|caption                   VALUE_SET|text_idle_value|4
505 507  VALUE_EVENT_EVAL|text_idle_value|EQ|3|FALSE  VALUE_EVAL|text_idle_value|EQ|4
507 508  VALUE_EVENT_EVAL|text_idle_value|EQ|4|TRUE   TEXTAREA_SET|caption|"「あるある」では、首都大あるあるをお伝えします。"
508   2  TEXTAREA_EVENT_SET|caption                   VALUE_SET|text_idle_value|5
507 509  VALUE_EVENT_EVAL|text_idle_value|EQ|4|FALSE  <eps>
509 510  <eps>                                        TEXTAREA_SET|caption|"「天気」、「首都大のTwitter」、「ひま」、「あるある」以外にもわかる言葉はあるので話しかけてください♪"
510   2  TEXTAREA_EVENT_SET|caption                   VALUE_SET|text_idle_value|1

#雑談

# 1131-1140 
1    1131   RECOG_EVENT_STOP|ねむい             <eps>
1    1131   RECOG_EVENT_STOP|眠い               <eps>
1131    2   <eps>                             SYNTH_START|mei|mei_voice_normal|そうだね。私もちょっと眠いな。

# 1141-1150
1    1141  RECOG_EVENT_STOP|元気                SYNTH_START|mei|mei_voice_normal|私は元気です。
1141    2  <eps>                                MOTION_ADD|mei|action|Motion\mei_guts\mei_guts.vmd

# 1151-1160
1    1151  RECOG_EVENT_STOP|かっこいい          VALUE_SET|x|0|3
1151 1152  VALUE_EVENT_SET|x                    VALUE_EVAL|x|LE|1
1152    2  VALUE_EVENT_EVAL|x|LE|1|TRUE         SYNTH_START|mei|mei_voice_normal|ありがとう。
1152 1153  VALUE_EVENT_EVAL|x|LE|1|FALSE        VALUE_EVAL|x|LE|2
1153    2  VALUE_EVENT_EVAL|x|LE|2|TRUE         SYNTH_START|mei|mei_voice_normal|ほめられると、うれしいです。
1153    2  VALUE_EVENT_EVAL|x|LE|2|FALSE        SYNTH_START|mei|mei_voice_normal|照れてしまいます。

# 1161-1170
1    1161  RECOG_EVENT_STOP|おはよう           <eps>
1    1161  RECOG_EVENT_STOP|お早う             <eps>
1161 1162  <eps>                               SYNTH_START|mei|mei_voice_normal|おはようございます。
1    1162  RECOG_EVENT_STOP|こんにちは         <eps>
1    1162  RECOG_EVENT_STOP|こんばんは         <eps>
1162    2  <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd

# 1171-1180
1    1171  RECOG_EVENT_STOP|趣味                VALUE_SET|x|0|3
1171 1172  VALUE_EVENT_SET|x                    VALUE_EVAL|x|LE|1
1172    2  VALUE_EVENT_EVAL|x|LE|1|TRUE         SYNTH_START|mei|mei_voice_normal|ヒミツです。
1172 1173  VALUE_EVENT_EVAL|x|LE|1|FALSE        VALUE_EVAL|x|LE|2
1173    2  VALUE_EVENT_EVAL|x|LE|2|TRUE         SYNTH_START|mei|mei_voice_normal|お話することです。
1173    2  VALUE_EVENT_EVAL|x|LE|2|FALSE        SYNTH_START|mei|mei_voice_normal|みんなの話を聞くと、楽しい気持ちになります。

# 1181-1190
1     1180 RECOG_EVENT_STOP|号館             MODEL_DELETE|menu
1     1180 RECOG_EVENT_STOP|地図             MODEL_DELETE|menu
1     1180 RECOG_EVENT_STOP|迷子             MODEL_DELETE|menu
1180  1181 <eps>                             SYNTH_START|mei|mei_voice_normal|日野キャンパスの地図を表示します。
1181  1182 <eps>                             TEXTAREA_SET|caption|"「おわり」と話すと、スタート画面に戻ります！）" 
1182  1183 <eps>                             TEXTAREA_ADD|map|20,20|1,1,1|1,1,1,0|0,0,0,0|-13,15,0
1183  1184 TEXTAREA_EVENT_ADD|map            TEXTAREA_SET|map|image\map2.png
1184  1185 RECOG_EVENT_STOP|おわり           TEXTAREA_DELETE|map
1185     2 TEXTAREA_EVENT_DELETE|map         MODEL_ADD|menu|Accessory\menu1\menu.pmd|0.0,-2,0.0|0.0,0.0,0.0|ON|mei

# 1191-1100
1     1191 KEY|a                                TEXTAREA_ADD|kaiwa|20,20|1,1,1|1,1,1,0|0,0,0,0|-13,15,0
1191  1192 TEXTAREA_EVENT_ADD|kaiwa             TEXTAREA_SET|kaiwa|image\kaiwa.png
1192  1193 <eps>                                TEXTAREA_SET|hyouzi|"aを押すと会話に戻ります。"
1193  1194 KEY|a                                TEXTAREA_DELETE|kaiwa
1194     2 <eps>                                TEXTAREA_SET|hyouzi|"aを押すと反応する言葉一覧が見えます。"


#weather information
1    1001 RECOG_EVENT_STOP|天気               SYNTH_START|mei|mei_voice_normal|今日の天気か明日の天気どちらを知りたいですか？今日か明日で答えてね。
1001 1002 RECOG_EVENT_STOP|今日               SYNTH_START|mei|mei_voice_normal|今日の天気は晴のち曇です。
1001 1002 RECOG_EVENT_STOP|明日               SYNTH_START|mei|mei_voice_normal|明日の天気は晴れです。
1002  2    SYNTH_EVENT_STOP|mei                <eps>

#twitter information
1    601  RECOG_EVENT_STOP|Twitter            SYNTH_START|mei|mei_voice_normal|首都大学東京公式ツイッターアカウントのツイ―トを読み上げますか？はいかいいえで答えてね。
601  602  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|お知らせ,大学教育センター,1月24日(木,)～2月8日(金),の,11:00,17:00,土,月曜,祝日休室,91年館学芸員養成,課程展示室にて,博物館実習１,の,実習成果展示,三脚椅子から,眺める生活技術を,比較するささやかな実験,を,
601  602  RECOG_EVENT_STOP|いいえ　　　　　 　SYNTH_START|mei|mei_voice_normal|わかりました。
602  2    SYNTH_EVENT_STOP|mei                <eps>