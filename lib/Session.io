Session := Object clone do(
  init := method(
    callbacks ::= Registry clone
  )

  handle := method(request, response,
    request getParameters foreach(k, v,
      callback := callbacks find(k)
      if(callback,
        callback second call(v, request)
      )
    )
    k := request getParameters at("_k")
    if(k,
      callback := callbacks find(k)
      if (callback, 
        callback second call(request)
      )
    )

    html := Canvas clone
    html callbacks = callbacks
    html render(root)
    response setBody(html result)
  )
)


