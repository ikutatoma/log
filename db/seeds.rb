user = User.create({name:"じゃが",password:"jaga",password_confirmation:"jaga",simple_word:"頑張ります！",color:"#2ecc71",place:"大阪"})
 question = Question.create({title:"おはよう",content:"今起きた", course_id: 2, user: user})
 course = Course.create([{name:"Unity"},{name:"WebD"},{name:"WebS"},
  {name:"Minecraft"},{name:"Designer"},{name:"iPhone"},{name:"DTM"},{name:"IOT"},{name:"Photo"}])
Like.create({user: user, question: question})
