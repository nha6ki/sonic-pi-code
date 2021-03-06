# https://sonic-pi.net/

# Haunted Bells

##| loop do
##|   sample :perc_bell, rate: (rrand 0.125, 1.5)
##|   sleep rrand(0, 2)
##| end

# Pentatonic Bleeps

##| with_fx :reverb, mix: 0.2 do
##|   loop do
##|     play scale(:Eb2, :major_pentatonic, num_octaves: 3).choose, release: 0.1, amp: rand
##|     sleep 0.1
##|   end
##| end

# Tron Bikes

##| loop do
##|   with_synth :dsaw do
##|     with_fx(:slicer, phase: [0.25, 0.125].choose) do
##|       with_fx(:reverb, room: 0.5, mix: 0.3) do
##|         start_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose
##|         final_note = chord([:b1, :b2, :e1, :e2, :b3, :e3].choose, :minor).choose

##|         p = play start_note, release: 8, note_slide: 4, cutoff: 30, cutoff_slide: 4, detune: rrand(0, 0.2), pan: rrand(-1, 0), pan_slide: rrand(4, 8)
##|         control p, note: final_note, cutoff: rrand(80, 120), pan: rrand(0, 1)
##|       end
##|     end
##|   end
##|   sleep 8
##| end

# Wob Rhythm

##| with_fx :reverb do
##|   in_thread do
##|     loop do
##|       r = [0.5, 1.0/3.0, 3.0/5.0].choose
##|       8.times do
##|         sample :ambi_choir, rate: r, pan: rrand(-1, 1)
##|         sleep 0.5
##|       end
##|     end
##|   end
##| end

##| with_fx :wobble, phase: 2 do |w|
##|   with_fx :echo, mix: 0.6 do
##|     loop do
##|       sample :drum_heavy_kick
##|       sample :bass_hit_c, rate: 0.8, amp: 0.4
##|       sleep 1
##|     end
##|   end
##| end

# Ocean Waves

##| with_fx :reverb, mix: 0.5 do
##|   loop do
##|     s = synth [:bnoise, :cnoise, :gnoise].choose, amp: rrand(0.5, 1.5), attack: rrand(0, 4), sustain: rrand(0, 2), release: rrand(1, 3), cutoff_slide: rrand(0, 3), cutoff: rrand(60, 80), pan: rrand(-1, 1), pan_slide: 1, amp: rrand(0.5, 1)
##|     control s, pan: rrand(-1, 1), cutoff: rrand(60, 115)
##|     sleep rrand(2, 3)
##|   end
##| end

# IDM Breakbeat

##| define :play_bb do |n|
##|   sample :drum_heavy_kick
##|   sample :ambi_drone, rate: [0.25, 0.5, -0.125, 1].choose, amp: 0.25 if rand < 0.125
##|   sample :ambi_lunar_land, rate: [0.5, 0.125, 1, -1, -0.5].choose, amp: 0.25 if rand < 0.125
##|   sample :loop_amen, attack: 0, release: 0.05, start: 1-(1.0/n), rate: [1,1,1,1,1,1,-1].choose
##|   sleep sample_duration(:loop_amen)/n
##| end
##| loop {play_bb([1,2,4,8,16].choose)}

# Acid Walk

in_thread do
  use_synth :fm
  sleep 2
  loop do
    28.times do
      sample :drum_bass_hard, amp: 0.8
      sleep 0.25
      play :e2, release: 0.2
      sample :elec_cymbal, rate: 12, amp: 0.6
      sleep 0.25
    end
    sleep 4
  end
end

use_synth :tb303
with_fx :reverb do |rev|
  loop do
    control rev, mix: rrand(0, 0.3)
    with_fx :slicer, phase: 0.125 do
      sample :ambi_lunar_land, sustain: 0, release: 8, amp: 2
    end
    
    control rev, mix: rrand(0, 0.6)
    r = rrand(0.05, 0.3)
    64.times do
      play chord(:e3, :minor).choose, release: r, cutoff: rrand(50, 90), amp: 0.5
      sleep 0.125
    end
    
    control rev, mix: rrand(0, 0.6)
    r = rrand(0.1, 0.2)
    with_synth :prophet do
      32.times do
        sleep 0.125
        play chord(:a3, :m7).choose, release: r, cutoff: rrand(40, 130), amp: 0.7
      end
    end
    
    control rev, mix: rrand(0, 0.6)
    r = rrand(0.05, 0.3)
    32.times do
      play chord(:e3, :minor).choose, release: r, cutoff: rrand(110, 130), amp: 0.4
      sleep 0.125
    end
    
    control rev, mix: rrand(0, 0.6)
    with_fx :echo, phase: 0.25, decay: 8 do
      16.times do
        play chord([:e2, :e3, :e4].choose, :m7).choose, release: 0.05, cutoff: rrand(50, 129), amp: 0.5
        sleep 0.125
      end
    end
  end
end

