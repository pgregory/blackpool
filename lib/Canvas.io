Message isSingular := method(self next == nil)

Canvas := Object clone do(
  init := method(
    result ::= Sequence clone
    callbacks ::= nil
  )

  elements := """h1 h2 h3 h4 h5 h6 a abbr area b blockquote body br canvas caption cite code col dd del div dt dl em embed footer head header i html hr label nav p script sup summery textarea td tbody table tfoot th thead title time tr u ul ol li"""
  elements split foreach(tag,
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

  render := method(component,
    component renderOn(self)
  )
)

