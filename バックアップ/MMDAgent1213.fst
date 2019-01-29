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
11   12   MODEL_EVENT_ADD|bootscreen          MODEL_ADD|mei|Model\2018_c2_3dmodel\TMUboyv107.pmd|0.0,0.0,-14.0
12   13   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|ON|mei
13   14   <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF|OFF
14   15   <eps>                               STAGE|Stage\sekino\sample1.pmd
15   16   <eps>                               MOTION_ADD|mei|base|Motion\mei_wait\mei_wait.vmd|FULL|LOOP|ON|OFF
16   17   <eps>                               TIMER_START|bootscreen|1.5
17   18   <eps>				      EXECUTE|updatefstfile.exe
18   2    TIMER_EVENT_STOP|bootscreen         MODEL_DELETE|bootscreen

# 0021-0030 Idle behavior

2    21   <eps>                               TIMER_START|idle1|20
21   22   TIMER_EVENT_START|idle1             TIMER_START|idle2|40
22   23   TIMER_EVENT_START|idle2             TIMER_START|idle3|60
23   1    TIMER_EVENT_START|idle3             VALUE_SET|random|0|100
1    1    RECOG_EVENT_START                   MOTION_ADD|mei|listen|Expression\mei_listen\mei_listen.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle1              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_boredom.vmd|PART|ONCE
1    1    TIMER_EVENT_STOP|idle2              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_touch_clothes.vmd|PART|ONCE
1    2    TIMER_EVENT_STOP|idle3              MOTION_ADD|mei|idle|Motion\mei_idle\mei_idle_think.vmd|PART|ONCE

# 0031-0040 Hello

1    31   KEY|4         		      SYNTH_START|mei|mei_voice_normal|さようなら。
1    31   RECOG_EVENT_STOP|こんにちわ         SYNTH_START|mei|mei_voice_normal|さようなら。
31   32   <eps>                               MOTION_ADD|mei|action|Motion\mei_greeting\mei_greeting.vmd|PART|ONCE
32   33   <eps>				      IMAGE_DELETE|mei
33   2    SYNTH_EVENT_STOP|mei                <eps>





# 0041-0050 Self introduction

1    41   RECOG_EVENT_STOP|自己紹介           SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|あなた,誰          SYNTH_START|mei|mei_voice_normal|メイと言います。
1    41   RECOG_EVENT_STOP|君,誰              SYNTH_START|mei|mei_voice_normal|メイと言います。
41   42   <eps>                               MOTION_ADD|mei|action|Motion\mei_self_introduction\mei_self_introduction.vmd|PART|ONCE
42   43   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|よろしくお願いします。
43   2    SYNTH_EVENT_STOP|mei                <eps>

# 0051-0060 Thank you

1    51   RECOG_EVENT_STOP|ありがと           SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|ありがとう         SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有難う             SYNTH_START|mei|mei_voice_normal|どういたしまして。
1    51   RECOG_EVENT_STOP|有り難う           SYNTH_START|mei|mei_voice_normal|どういたしまして。
51   52   <eps>                               MOTION_ADD|mei|expression|Expression\mei_happiness\mei_happiness.vmd|PART|ONCE
52   53   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_happy|いつでも、話しかけてくださいね。
53   54   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
54   2    SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd

# 0061-0070 Positive comments

1    61   RECOG_EVENT_STOP|可愛い             VALUE_EVAL|random|LE|20
1    61   RECOG_EVENT_STOP|かわいい           VALUE_EVAL|random|LE|20
1    61   RECOG_EVENT_STOP|綺麗               VALUE_EVAL|random|LE|20
1    61   RECOG_EVENT_STOP|きれい             VALUE_EVAL|random|LE|20
61   62   VALUE_EVENT_EVAL|random|LE|20|TRUE  SYNTH_START|mei|mei_voice_bashful|恥ずかしいです。
61   62   VALUE_EVENT_EVAL|random|LE|20|FALSE SYNTH_START|mei|mei_voice_bashful|ありがとう。
62   63   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
63   2    SYNTH_EVENT_STOP|mei                <eps>

# 0071-0090 Guide

1    71    KEY|3		              MODEL_DELETE|menu
71   72   <eps>                               MODEL_ADD|panel|Accessory\map\map_library.pmd|0.0,2.8,2.5|0.0,0.0,0.0|ON|mei
72   73   <eps>                               MOTION_ADD|mei|action|Motion\mei_panel\mei_panel_on.vmd|PART|ONCE
73   74   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_normal.vmd
74   75   <eps>                               SYNTH_START|mei|mei_voice_normal|図書館は、正面から見ると、右前の方向にあります。
75   76   SYNTH_EVENT_STOP|mei                MOTION_ADD|mei|look|Motion\mei_look\mei_look_down.vmd|PART|ONCE
76   77   <eps>                               SYNTH_START|mei|mei_voice_normal|キャンパスマップでは、こちらになります。
77   78   <eps>                               MOTION_ADD|mei|action|Motion\mei_point\mei_point_center_buttom.vmd|PART|ONCE
78   79   SYNTH_EVENT_STOP|mei                MOTION_CHANGE|mei|base|Motion\mei_guide\mei_guide_happy.vmd
79   80   <eps>                               SYNTH_START|mei|mei_voice_normal|お解りになりますか？
80   81   SYNTH_EVENT_STOP|mei                MODEL_DELETE|panel
81   82   <eps>                               MODEL_ADD|menu|Accessory\menu\menu.pmd|0.0,-4.5,0.0|0.0,0.0,0.0|mei
82   83   <eps>                               MOTION_CHANGE|mei|base|Motion\mei_wait\mei_wait.vmd
83   2    <eps>                               MOTION_ADD|menu|rotate|Motion\menu_rotation\menu_rotation.vmd|FULL|LOOP|OFF

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


# 0131-0140 Tonkatsu

1    131   RECOG_EVENT_STOP|テスト	       VALUE_EVAL|random|LE|50
131  132   VALUE_EVENT_EVAL|random|LE|50|TRUE  SYNTH_START|mei|mei_voice_bashful|今日のご飯はおしゅしだよお。
131  132   VALUE_EVENT_EVAL|random|LE|50|FALSE SYNTH_START|mei|mei_voice_bashful|てめえにやる飯はねえ。

132  133   <eps>                               MOTION_ADD|mei|expression|Expression\mei_bashfulness\mei_bashfulness.vmd|PART|ONCE
133   2    SYNTH_EVENT_STOP|mei                <eps>

# 0141-0300 1mon1tou

1    142   RECOG_EVENT_STOP|ひま	       SYNTH_START|mei|mei_voice_normal|質問をはじめるよお。
1    142   KEY|1			       SYNTH_START|mei|mei_voice_normal|それじゃあ、今のあなたの気分でのおすすめの暇つぶしスポットを教えちゃうよ！
142  143   SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|今から私がする質問に、はいかいいえで答えてね！じゃあはじめるよ！
143  144   SYNTH_EVENT_STOP|mei		       SYNTH_START|mei|mei_voice_normal|質問1、今日はちゃんと朝ごはんを食べてきましたか？ 
144  150   RECOG_EVENT_STOP|はい	       VALUE_SET|x|1
144  150   KEY|1			       VALUE_SET|x|1
144  150   RECOG_EVENT_STOP|の             　　VALUE_SET|x|0
144  150   KEY|2			       VALUE_SET|x|0			       
150  151   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問2、値段より質？
151  152   RECOG_EVENT_STOP|はい               VALUE_EVAL|x|EQ|1
151  152   KEY|1			       VALUE_EVAL|x|EQ|1
152  153   VALUE_EVENT_EVAL|x|EQ|1|TRUE        VALUE_SET|x|2
152  153   VALUE_EVENT_EVAL|x|EQ|1|FALSE       VALUE_SET|x|1
151  153   RECOG_EVENT_STOP|の		       <eps>
151  153   KEY|2			       <eps>

153  154   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問3、そういえば、おなかが減ってきたなぁ。
154  155   RECOG_EVENT_STOP|はい               VALUE_EVAL|x|EQ|2
154  155   KEY|1			       VALUE_EVAL|x|EQ|2
155  160   VALUE_EVENT_EVAL|x|EQ|2|TRUE        VALUE_SET|x|3
155  157   VALUE_EVENT_EVAL|x|EQ|2|FALSE       VALUE_EVAL|x|EQ|1
157  160   VALUE_EVENT_EVAL|x|EQ|1|TRUE        VALUE_SET|x|2
157  160   VALUE_EVENT_EVAL|x|EQ|1|FALSE       VALUE_SET|x|1
154  160   RECOG_EVENT_STOP|の		       <eps>
154  160   KEY|2			       <eps>

160  161   <eps>			       SYNTH_START|mei|mei_voice_normal|質問4、一人でも全然オッケー。			       
161  162   RECOG_EVENT_STOP|はい	       VALUE_SET|y|1
161  162   KEY|1			       VALUE_SET|y|1
161  162   RECOG_EVENT_STOP|の             　　VALUE_SET|y|0
161  162   KEY|2			       VALUE_SET|y|0			       
162  163   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問5、立っているの、疲れたな。
163  164   RECOG_EVENT_STOP|はい               VALUE_EVAL|y|EQ|1
163  164   KEY|1			       VALUE_EVAL|y|EQ|1
164  165   VALUE_EVENT_EVAL|y|EQ|1|TRUE        VALUE_SET|y|2
164  165   VALUE_EVENT_EVAL|y|EQ|1|FALSE       VALUE_SET|y|1
163  165   RECOG_EVENT_STOP|の		       <eps>
163  165   KEY|2			       <eps>

165  166   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問6、広いところより狭いところの方が落ち着くよね。
166  167   RECOG_EVENT_STOP|はい               VALUE_EVAL|y|EQ|2
166  167   KEY|1			       VALUE_EVAL|y|EQ|2
167  170   VALUE_EVENT_EVAL|y|EQ|2|TRUE        VALUE_SET|y|3
167  168   VALUE_EVENT_EVAL|y|EQ|2|FALSE       VALUE_EVAL|y|EQ|1
168  170   VALUE_EVENT_EVAL|y|EQ|1|TRUE        VALUE_SET|y|2
168  170   VALUE_EVENT_EVAL|y|EQ|1|FALSE       VALUE_SET|y|1
166  170   RECOG_EVENT_STOP|の		       <eps>
166  170   KEY|2			       <eps>

170  171   <eps>			       SYNTH_START|mei|mei_voice_normal|質問7、テスト期間、そろそろじゃない？			       
171  172   RECOG_EVENT_STOP|はい	       VALUE_SET|z|1
171  172   KEY|1			       VALUE_SET|z|1
171  172   RECOG_EVENT_STOP|の             　　VALUE_SET|z|0
171  172   KEY|2			       VALUE_SET|z|0			       
172  173   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問8、最近授業中よく寝ちゃうんだよなぁ。
173  174   RECOG_EVENT_STOP|はい               VALUE_EVAL|z|EQ|1
173  174   KEY|1			       VALUE_EVAL|z|EQ|1
174  175   VALUE_EVENT_EVAL|z|EQ|1|TRUE        VALUE_SET|z|2
174  175   VALUE_EVENT_EVAL|z|EQ|1|FALSE       VALUE_SET|z|1
173  175   RECOG_EVENT_STOP|の		       <eps>
173  175   KEY|2			       <eps>

175  176   <eps>         		       SYNTH_START|mei|mei_voice_normal|質問9、あなた、今勉強したいんじゃない？
176  177   RECOG_EVENT_STOP|はい               VALUE_EVAL|z|EQ|2
176  177   KEY|1			       VALUE_EVAL|z|EQ|2
177  180   VALUE_EVENT_EVAL|z|EQ|2|TRUE        VALUE_SET|z|3
177  178   VALUE_EVENT_EVAL|z|EQ|2|FALSE       VALUE_EVAL|z|EQ|1
178  180   VALUE_EVENT_EVAL|z|EQ|1|TRUE        VALUE_SET|z|2
178  180   VALUE_EVENT_EVAL|z|EQ|1|FALSE       VALUE_SET|z|1
176  180   RECOG_EVENT_STOP|の		       <eps>
176  180   KEY|2			       <eps>


180  181   <eps>			       VALUE_EVAL|x|EQ|0
181  190   VALUE_EVENT_EVAL|x|EQ|0|TRUE        SYNTH_START|mei|mei_voice_normal|xは０点、
181  183   VALUE_EVENT_EVAL|x|EQ|0|FALSE       VALUE_EVAL|x|EQ|1
183  190   VALUE_EVENT_EVAL|x|EQ|1|TRUE        SYNTH_START|mei|mei_voice_normal|xは１点、
183  185   VALUE_EVENT_EVAL|x|EQ|1|FALSE       VALUE_EVAL|x|EQ|2
185  190   VALUE_EVENT_EVAL|x|EQ|2|TRUE        SYNTH_START|mei|mei_voice_normal|xは２点、
185  186   VALUE_EVENT_EVAL|x|EQ|2|FALSE       VALUE_EVAL|x|EQ|3
186  190   VALUE_EVENT_EVAL|x|EQ|3|TRUE        SYNTH_START|mei|mei_voice_normal|xは３点、

190  191   SYNTH_EVENT_STOP|mei		       VALUE_EVAL|y|EQ|0
191  200   VALUE_EVENT_EVAL|y|EQ|0|TRUE        SYNTH_START|mei|mei_voice_normal|yは０点、
191  193   VALUE_EVENT_EVAL|y|EQ|0|FALSE       VALUE_EVAL|y|EQ|1
193  200   VALUE_EVENT_EVAL|y|EQ|1|TRUE        SYNTH_START|mei|mei_voice_normal|yは１点、
193  195   VALUE_EVENT_EVAL|y|EQ|1|FALSE       VALUE_EVAL|y|EQ|2
195  200   VALUE_EVENT_EVAL|y|EQ|2|TRUE        SYNTH_START|mei|mei_voice_normal|yは２点、
195  196   VALUE_EVENT_EVAL|y|EQ|2|FALSE       VALUE_EVAL|y|EQ|3
196  200   VALUE_EVENT_EVAL|y|EQ|3|TRUE        SYNTH_START|mei|mei_voice_normal|yは３点、

200  201   SYNTH_EVENT_STOP|mei		       VALUE_EVAL|z|EQ|0
201  210   VALUE_EVENT_EVAL|z|EQ|0|TRUE        SYNTH_START|mei|mei_voice_normal|ゼットは０点です。
201  203   VALUE_EVENT_EVAL|z|EQ|0|FALSE       VALUE_EVAL|z|EQ|1
203  210   VALUE_EVENT_EVAL|z|EQ|1|TRUE        SYNTH_START|mei|mei_voice_normal|ゼットは１点です。
203  205   VALUE_EVENT_EVAL|z|EQ|1|FALSE       VALUE_EVAL|z|EQ|2
205  210   VALUE_EVENT_EVAL|z|EQ|2|TRUE        SYNTH_START|mei|mei_voice_normal|ゼットは２点です。
205  206   VALUE_EVENT_EVAL|z|EQ|2|FALSE       VALUE_EVAL|z|EQ|3
206  210   VALUE_EVENT_EVAL|z|EQ|3|TRUE        SYNTH_START|mei|mei_voice_normal|ゼットは３点です。



210  211   SYNTH_EVENT_STOP|mei                VALUE_EVAL|x|GE|2
211  212   VALUE_EVENT_EVAL|x|GE|2|TRUE        VALUE_EVAL|y|GE|2
212  213   VALUE_EVENT_EVAL|y|GE|2|TRUE        VALUE_EVAL|z|GE|2
213  230   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|そうね、たしかキャンパスの近くにサイゼリアがあったはずだわ。たしかこのあたりよ。ここなら勉強をしながら食事もできるし今のあなたにはいいんじゃないかしら。
213  230   VALUE_EVENT_EVAL|z|GE|2|FALSE       SYNTH_START|mei|mei_voice_normal|ちかくのコンビににいってみてはどうかしら。あそこって意外とうちのだいがくのひとがこない穴場なのよ。

212  214   VALUE_EVENT_EVAL|y|GE|2|FALSE       VALUE_EVAL|z|GE|2
214  230   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|がくしょくにいきましょう。みんなで今週の課題の話でもしてみてはどうかしら。
214  230   VALUE_EVENT_EVAL|z|GE|2|FALSE       SYNTH_START|mei|mei_voice_normal|すこしとよだ駅のほうに歩いていくと、ぜんや、というお弁当屋さんがあるわ。あそこのお弁当、安くておいしいから私はとてもすきなの。


210  215   VALUE_EVENT_EVAL|x|GE|2|FALSE       VALUE_EVAL|y|GE|2
215  216   VALUE_EVENT_EVAL|y|GE|2|TRUE        VALUE_EVAL|z|GE|2
216  230   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|図書館に行って勉強するっていうのはどうかしら。うちの大学の図書館はとても静かだから私もよく勉強するときはあそこにいくわ。
216  230   VALUE_EVENT_EVAL|z|GE|2|FALSE       SYNTH_START|mei|mei_voice_normal|二号館の二階の、こうどう前のすぺーすって、イベントとかのない日はほんとに誰も来ないのよ。次の授業まであそこの机でひとやすみしませんか。

215  217   VALUE_EVENT_EVAL|y|GE|2|FALSE       VALUE_EVAL|z|GE|2
217  230   VALUE_EVENT_EVAL|z|GE|2|TRUE        SYNTH_START|mei|mei_voice_normal|次の授業の教室に行ってみませんか？この前の授業でわからなかったところを誰かに聞けるかもしれませんよ。

217  220   VALUE_EVENT_EVAL|z|GE|2|FALSE       VALUE_EVAL|x|LE|1

220  221   VALUE_EVENT_EVAL|x|LE|1|TRUE        VALUE_EVAL|y|LE|1
221  222   VALUE_EVENT_EVAL|y|LE|1|TRUE        VALUE_EVAL|z|LE|1
222  230   VALUE_EVENT_EVAL|z|LE|1|TRUE        SYNTH_START|mei|mei_voice_normal|そうですね、もしよければ私とはなしでもしませんか？じつはちょうど私もひまだったのです。
222  230   VALUE_EVENT_EVAL|z|LE|1|FALSE       SYNTH_START|mei|mei_voice_normal|研究室にすこしかおを出してみてはどうでしょうか。誰かいるかもしれませんよ。

221  223   VALUE_EVENT_EVAL|y|LE|1|FALSE       VALUE_EVAL|z|LE|1
223  230   VALUE_EVENT_EVAL|z|LE|1|TRUE        SYNTH_START|mei|mei_voice_normal|本でも読んでみてはいかがですか。わたしはこのまえ図書館で、もりみとみひこ、という方のかいた、夜行、という本をよんだの。面白かったからおすすめしておくわね。
223  230   VALUE_EVENT_EVAL|z|LE|1|FALSE       SYNTH_START|mei|mei_voice_normal|ひましてそうな友達に電話をしてみましょうよ。わたしもともだちと電話って、一度してみたいものです


220  224   VALUE_EVENT_EVAL|x|LE|1|FALSE       VALUE_EVAL|y|LE|1
224  225   VALUE_EVENT_EVAL|y|LE|1|TRUE        VALUE_EVAL|z|LE|1
225  230   VALUE_EVENT_EVAL|z|LE|1|TRUE        SYNTH_START|mei|mei_voice_normal|気分転換にだれかさそってカラオケでも行きましょう！え、次の授業ですって？それは・・・ふふふふ。
225  230   VALUE_EVENT_EVAL|z|LE|1|FALSE       SYNTH_START|mei|mei_voice_normal|たしかキャンパスの近くにマクドナルドがあったはずだわ。たしかこのあたりよ。すこしなにかたべて、お友達と宿題の話でもしましょうよ

224  226   VALUE_EVENT_EVAL|y|LE|1|FALSE       VALUE_EVAL|z|LE|1
226  230   VALUE_EVENT_EVAL|z|LE|1|TRUE        SYNTH_START|mei|mei_voice_normal|きょうはおうちにかえりましょう。そんな日もたまには必要です。
226  230   VALUE_EVENT_EVAL|z|LE|1|FALSE       SYNTH_START|mei|mei_voice_normal|とりあえず次の授業の教室にいっておきましょう。あ、その前に購買でおかしでも買ってきてはどうですか？

230  2     SYNTH_EVENT_STOP|mei                <eps>


# 0401-0450 aruaru
1    401   RECOG_EVENT_STOP|あるある            VALUE_SET|x||0|4
1    401   RECOG_EVENT_STOP|ある                VALUE_SET|x||0|4
401  402   VALUE_EVENT_SET|x                    VALUE_EVAL|x|LE|1
402  450    VALUE_EVENT_EVAL|x|LE|1|TRUE        SYNTH_START|mei|mei_voice_bashful|大学名記入時の困惑。
402  403   VALUE_EVENT_EVAL|x|LE|1|FALSE        VALUE_EVAL|x|LE|2
403  450    VALUE_EVENT_EVAL|x|LE|2|TRUE        SYNTH_START|mei|mei_voice_bashful|24時間いつでも使える研究室最高。
403  404   VALUE_EVENT_EVAL|x|LE|2|FALSE        VALUE_EVAL|x|LE|3
404  450   VALUE_EVENT_EVAL|x|LE|3|TRUE         SYNTH_START|mei|mei_voice_bashful|エレベーターが混んでいて階段で歩く。
404  405   VALUE_EVENT_EVAL|x|LE|3|FALSE        VALUE_EVAL|x|LE|4
405  450   VALUE_EVENT_EVAL|x|LE|4|TRUE         SYNTH_START|mei|mei_voice_bashful|移動がつらい。
405  406   VALUE_EVENT_EVAL|x|LE|4|FALSE        VALUE_EVAL|x|LE|5
406  450   VALUE_EVENT_EVAL|x|LE|5|TRUE         SYNTH_START|mei|mei_voice_bashful|ごこめ。
406  407   VALUE_EVENT_EVAL|x|LE|5|FALSE        VALUE_EVAL|x|LE|6
407  450   VALUE_EVENT_EVAL|x|LE|6|TRUE         SYNTH_START|mei|mei_voice_bashful|ろっこめ。
407  408   VALUE_EVENT_EVAL|x|LE|6|FALSE        VALUE_EVAL|x|LE|7
408  450   VALUE_EVENT_EVAL|x|LE|7|TRUE         SYNTH_START|mei|mei_voice_bashful|ななこめ。
408  409   VALUE_EVENT_EVAL|x|LE|7|FALSE        VALUE_EVAL|x|LE|8
409  450   VALUE_EVENT_EVAL|x|LE|8|TRUE         SYNTH_START|mei|mei_voice_bashful|はっこめ。
409  410   VALUE_EVENT_EVAL|x|LE|8|FALSE        VALUE_EVAL|x|LE|9
410  450   VALUE_EVENT_EVAL|x|LE|9|TRUE         SYNTH_START|mei|mei_voice_bashful|きゅうこめ。
410  411   VALUE_EVENT_EVAL|x|LE|9|FALSE        VALUE_EVAL|x|LE|10
411  450   VALUE_EVENT_EVAL|x|LE|10|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうこめ。
411  412   VALUE_EVENT_EVAL|x|LE|10|FALSE       VALUE_EVAL|x|LE|11
412  450   VALUE_EVENT_EVAL|x|LE|11|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅういちこめ。
412  413   VALUE_EVENT_EVAL|x|LE|11|FALSE       VALUE_EVAL|x|LE|12
413  450   VALUE_EVENT_EVAL|x|LE|12|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうにこめ。
413  414   VALUE_EVENT_EVAL|x|LE|12|FALSE       VALUE_EVAL|x|LE|13
414  450   VALUE_EVENT_EVAL|x|LE|13|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうさんこめ。
414  415   VALUE_EVENT_EVAL|x|LE|13|FALSE       VALUE_EVAL|x|LE|14
415  450   VALUE_EVENT_EVAL|x|LE|14|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうよんこめ。
415  416   VALUE_EVENT_EVAL|x|LE|14|FALSE       VALUE_EVAL|x|LE|15
416  450   VALUE_EVENT_EVAL|x|LE|15|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうごこめ。
416  417   VALUE_EVENT_EVAL|x|LE|15|FALSE       VALUE_EVAL|x|LE|16
417  450   VALUE_EVENT_EVAL|x|LE|16|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうろっこめ。
417  418   VALUE_EVENT_EVAL|x|LE|16|FALSE       VALUE_EVAL|x|LE|17
418  450   VALUE_EVENT_EVAL|x|LE|17|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうななこめ。
418  419   VALUE_EVENT_EVAL|x|LE|17|FALSE       VALUE_EVAL|x|LE|18
419  450   VALUE_EVENT_EVAL|x|LE|18|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうはちこめ。
419  420   VALUE_EVENT_EVAL|x|LE|18|FALSE       VALUE_EVAL|x|LE|19
420  450   VALUE_EVENT_EVAL|x|LE|19|TRUE        SYNTH_START|mei|mei_voice_bashful|じゅうきゅうこめ。
420  421   VALUE_EVENT_EVAL|x|LE|19|FALSE       VALUE_EVAL|x|LE|20
421  450   VALUE_EVENT_EVAL|x|LE|20|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅっこめ。
421  422   VALUE_EVENT_EVAL|x|LE|20|FALSE       VALUE_EVAL|x|LE|21
422  450   VALUE_EVENT_EVAL|x|LE|21|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅういちこめ。
422  423   VALUE_EVENT_EVAL|x|LE|21|FALSE       VALUE_EVAL|x|LE|22
423  450   VALUE_EVENT_EVAL|x|LE|22|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうにこめ。
423  424   VALUE_EVENT_EVAL|x|LE|22|FALSE       VALUE_EVAL|x|LE|23
424  450   VALUE_EVENT_EVAL|x|LE|23|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうさんこめ。
424  425   VALUE_EVENT_EVAL|x|LE|23|FALSE       VALUE_EVAL|x|LE|24
425  450   VALUE_EVENT_EVAL|x|LE|24|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうよんこめ。
425  426   VALUE_EVENT_EVAL|x|LE|24|FALSE       VALUE_EVAL|x|LE|25
426  450   VALUE_EVENT_EVAL|x|LE|25|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうごこめ。
426  427   VALUE_EVENT_EVAL|x|LE|25|FALSE       VALUE_EVAL|x|LE|26
427  450   VALUE_EVENT_EVAL|x|LE|26|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうろっこめ。
427  428   VALUE_EVENT_EVAL|x|LE|26|FALSE       VALUE_EVAL|x|LE|27
428  450   VALUE_EVENT_EVAL|x|LE|27|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうななこめ。
428  429   VALUE_EVENT_EVAL|x|LE|27|FALSE       VALUE_EVAL|x|LE|28
429  450   VALUE_EVENT_EVAL|x|LE|28|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうはちこめ。
429  430   VALUE_EVENT_EVAL|x|LE|28|FALSE       VALUE_EVAL|x|LE|29
430  450   VALUE_EVENT_EVAL|x|LE|29|TRUE        SYNTH_START|mei|mei_voice_bashful|にじゅうきゅうこめ。
430  450   VALUE_EVENT_EVAL|x|LE|29|FALSE       SYNTH_START|mei|mei_voice_bashful|さんじゅっこめ。
450   2    SYNTH_EVENT_STOP|mei                <eps>




#weather information
1    1001  KEY|a                             <eps>
1001 1002 RECOG_EVENT_STOP|今日               SYNTH_START|mei|mei_voice_normal|今日の天気は曇のち晴です。
1001 1002 RECOG_EVENT_STOP|明日               SYNTH_START|mei|mei_voice_normal|明日の天気は晴時々曇です。
1002  2    SYNTH_EVENT_STOP|mei                <eps>

#twitter information
1    601   KEY|5			       SYNTH_START|mei|mei_voice_normal|首都大学東京の公式ツイッターの情報を読み上げますか？はいかいいえでこたえろや				       
601  602  RECOG_EVENT_STOP|はい               SYNTH_START|mei|mei_voice_normal|【学内向けのお知らせ＠ダイバーシティ推進室】セクシュアル・マイノリティ理解・啓発の一環として講演会を開催します！今回は「働く」をテーマに、企業の人事担当者と、働く当事者の声をお届けします。参加を希望される方はダイバーシティ推進室ま… https://t.co/MIrJBYwz8O
602  2    SYNTH_EVENT_STOP|mei                <eps>