#Studio Music Records, this studio has two music rooms and one control room, one bar and a rooftop to enjoy the view
#the rooms are classified by type of music, classic and rock, and each one a set of instruments

guitars = { acustic_guitar: 2,
            eletric_guitar: 2 ,
            bass_guitar: 1
        }
microphones = { lead_mic: 1,
                back_mic: 3
            }
amps = {  bass_amp: 1,
          guitar_amp: 4,
          keyboard_amp: 1,
          vocals_amp: 4
      }

chairs = ['blue_chair','white_chair','green_chair','black_chair']

studio = {
  rooms: [
    rock: [guitars, microphones, amps,'drum kit','keyboard'],
    classic: ['piano','tabla','sitar','sarod','violin','cello'],
    control: ['computer','audio_interface','monitor managment']
    ],
  bar: ['beer','wiskey','refrigerator','food'],
  rooftop: ['cinder-box','sofa','table',chairs]
}

puts studio