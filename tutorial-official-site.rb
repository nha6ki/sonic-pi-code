# 1.1

##| live_loop :flibble do
##|   sample :ambi_choir, rate: 0.3
##|   sample :bd_haus, rate: 1
##|   sleep 1
##| end

##| live_loop :guit do
##|   with_fx :echo, mix: 0.3, phase: 0.25 do
##|     sample :guit_em9, rate: 0.5
##|   end
##|   sample :guit_em9, rate: -0.5
##|   sleep 8
##| end
##| live_loop :boom do
##|   with_fx :reverb, room: 1 do
##|     sample :bd_boom, amp: 10, rate: 1
##|   end
##|   sleep 8
##| end

# 2.1

##| play 72
##| sleep 1
##| play 75
##| sleep 1
##| play 79

##| play :Cb3
##| sleep 0.5
##| play :Db3
##| sleep 0.5
##| play :Eb3

# 2.2

##| play 50, amp: 0.1
##| sleep 0.25
##| play 55, amp: 0.2
##| sleep 0.25
##| play 57, amp: 0.4
##| sleep 0.25
##| play 62, amp: 1

##| play 60, pan: -1 # 音の位置（左）
##| play 60, pan: 1 # 音の位置（右）

# 2.3

##| use_synth :tb303
##| play 38
##| sleep 1
##| use_synth :dsaw
##| play 50
##| sleep 1
##| use_synth :prophet
##| play 62

# 2.4

##| play 60, release: 2
##| play 60, attack: 0.7, release: 4
##| play 60, attack: 0.3, sustain: 1, release: 1
##| play 60, attack: 0.1, attack_level: 1, decay: 0.2, sustain_level: 0.4, sustain: 1, release: 0.5

# 3.1

##| sample :ambi_lunar_land
##| sleep 1
##| play 48
##| sleep 0.5
##| play 36
##| sample :ambi_drone
##| sleep 1
##| play 36

# 3.2

##| sample :ambi_lunar_land, amp: 0.5

# 3.3

##| sample :loop_amen, rate: 0.5 # 再生速度（0.5倍） = 再生時間（2倍）
##| sample :loop_amen, rate: -2 # 逆再生（速度2倍） = 再生時間（0.5倍）

# 3.4
##| print sample_duration :loop_amen
##| sample :loop_amen, attack: 0.75, release: 0.75
##| sample :drum_cymbal_open, attack: 0.01, sustain: 0.3, release: 0.1

# 3.5
##| sample :loop_amen, start: 0.4, finish: 0.6
##| sample :loop_amen, start: 0.6, finish: 0.4
##| sample :loop_amen, start: 0.5, finish: 0.8, rate: -0.2, attack: 0.3, release: 1

# 3.6
##| sample "/Users/sam/Desktop/my-sound.wav", rate: 0.5, amp: 0.3

# 3.7
##| samps = "/path/to/my/samples/"
##| sample samps, 0 # 0番目のファイル
##| sample samps, "120", "A#" # ファイル名のフィルタリング
##| sample samps, "120", "Bb", 1, lpf: 70, amp: 2

# 4

##| loop do
##|   sample :perc_bell, rate: (rrand 0.125, 1.5)
##|   sleep rrand(0.2, 2)
##| end

##| use_synth :tb303
##| loop do
##|   play 50, release: 0.1, cutoff: rrand(60, 120)
##|   sleep 0.125
##| end

##| use_random_seed 40
##| 5.times do
##|   play rrand_i(50, 100)
##|   sleep 0.5
##| end

##| loop do
##|   play choose([60, 65, 72])
##|   sleep 1
##| end

##| loop do
##|   play 60, amp: rand
##|   sleep 0.25
##| end

##| dice(6)
##| one_in(6)

# 5


