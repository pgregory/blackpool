Message isSingular := method(self next == nil)

Canvas := Object clone do(
  init := method(
    result ::= Sequence clone
    callbacks ::= nil
  )

  elementWith := block(
    canvas := call target
    rest := List clone
    canvas result appendSeq("<" .. call message name )
    call message arguments foreach(arg, 
      if( arg isSingular and arg name == "updateSlot"
        , name := arg argAt(0) cachedResult
          value := call sender doMessage(arg argAt(1))
          canvas result appendSeq(" ", name, "=\"", value, "\"")
        , rest append(arg)
        )
    )
    canvas result appendSeq(">")
    
    rest foreach(r,
      r doInContext(call sender) ?renderOn(canvas)
    )
    canvas result appendSeq("</" .. call message name .. ">")
    canvas
  )

  "h1 p div tr td table form label select option" split foreach(tag,
    setSlot(tag, 
      method(
        Tag clone setTag(call message name)
      )
    )
  )

  text := method(str,
    result appendSeq(str)
    self
  )

  space := method(str,
    result appendSeq("&nbsp;")
    self
  )

  link := method(name, code,
    id := callbacks register(list(call sender, code))
    result appendSeq("<a href='?_k=",id,"'>",name,"</a>")
    self
  )

  button := method(name, code,
    id := callbacks register(list(call sender, code))
    result appendSeq("<button type='submit' name='_k' value='",id,"'>",name,"</button>")
    self
  )

  inputText := method(
    InputTextTag clone
  )

  inputDate := method(
    InputDateTag clone
  )

)

