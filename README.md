# EZAudioFileInfo
A light library for getting Audio File Info

You can get demo at: [HERE](https://github.com/Dendim0n/SimpleMusicPlayer) 

Usage:

         let path = Bundle.main.path(forResource: "fileName", ofType: "fileSuffix")
         let fileInfo = EZAudioFileInfo()
         fileInfo.loadFile(path!)
         //If you have placeholder
         fileInfo.placeholder = UIImage.init(named:"pic")
         //Get data:
         let player = AVAudioPlayer.init(data: fileInfo.getData())
         //Get metadata:
         let title = fileInfo.getTitle()
         let artist = fileInfo.getArtist()
         let album = fileInfo.getAlbum()
         let coverImage = fileInfo.getArtwork()
         let duration = fileInfo.getDuration() //String like "12:34"