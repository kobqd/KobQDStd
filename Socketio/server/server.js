//npm i @socket.io/admin-ui
const {instrument} = require('@socket.io/admin-ui');
const io = require('socket.io')(3000,{
  cors:{
    origin:[
      "http://localhost:8080",
      "https://admin.socket.io"
    ],
  }
});

io.on('connection',socket => {
  console.log(socket.id);
  socket.on('send-message',(message, room)=>{
    // io.emit('receive-message',message);       // send All socket
    if(room == ''){
      socket.broadcast.emit('receive-message',message); // send other socket except me
    }else{
      socket.to(room).emit('receive-message',message) // send to socket with room id only
    }
    
    console.log(message);
  })
  socket.on('join-room',(room,cb) => {
    socket.join(room);
    cb(`Join ${room}`);
  })
})

instrument(io,{auth: false})