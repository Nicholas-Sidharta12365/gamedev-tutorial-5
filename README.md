# Tutorial 3
Fitur lanjutan yang dikerjakan:
1. Double jump: Implementasi dilakukan dengan membuat variabel yang akan direset ketika player menyentuh tanah. Ketika pemain melompat dan menekan tombol jump lagi, maka pemain akan melompat lagi jika variabel tersebut memberikan kondisi true, setelah lompatan kedua maka variabel akan di set ke false sehingga pemain tidak bisa melompat lagi.
2. Dashing: Implementasi dilakukan dengan set velocity ke value tertentu lalu menset nilai positif dan negatif sesuai dengan arah yang sedang dihadapi oleh player.
3. Sliding: Implementasi dilakukan dengan player menekan tombol bawah saat ditanah maka player akan menjadi lebih cepat dibandingkan melakukan dashing. Sehingga diberikan check jika player sedang di ground atau tidak, jika ya dan tombol bawah ditekan maka player akan melakukan sliding.

# Tutorial 5
1. Objek baru: Implementasi dilakukan dengan membuat animatedsprite baru dengan collisionshape2d yang akan digunakan sebagai objek baru. Lalu diletakan pada main scene. Juga diberikan logic untuk bergerak ke kiri dan ke kanan secara random. Untuk mencegah player dan objek keluar dari arena maka diberikan collisionshape2d pada main scene yang menjadi invisible wall pada game.
2. SFX: Implementasi dilakukan dengan menambahkan audio stream player pada node player yang diberikan file .ogg yang akan digunakan sebagai sfx lompat dari player.
3. BGM: Implementasi dilakukan dengan menambahkan audio stream player pada main scene yang diberikan file .ogg yang akan digunakan sebagai background music dari game.
4. Interaksi object dengan pemain: Interaksi yang dibuat adalah efek knockback pada objek ketikan player menyentuh objek tersebut. Implementasi dilakukan dengan menambahkan area2d pada objek yang akan digunakan sebagai trigger untuk mengecek apakah player menyentuh objek tersebut. Jika iya maka objek tersebut akan di set kecepatan knockback ke arah yang berlawanan dengan arah player. Kecepatan knockback adalah sebuah constant yang diberikan pada objek tersebut.
5. Audio Feedback: Implementasi dilakukan dengan menambahkan audio stream player pada node objek yang diberikan file .ogg yang akan digunakan sebagai sfx knockback dari player.