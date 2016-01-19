Importer addSearchPath(Directory currentWorkingDirectory asMutable appendPathSeq("../../lib"))
Importer addSearchPath(Directory currentWorkingDirectory asMutable appendPathSeq("models"))
Importer addSearchPath(Directory currentWorkingDirectory asMutable appendPathSeq("components"))

server := HttpServer clone do(
  setPort(8090)

  sessions := Registry clone

  renderResponse := method(request, response,
    session := nil
    cookie := request cookies at("ioweb")
    if (cookie != nil, session = sessions find(cookie))
    if (session == nil,
      session = Session clone do(
        root ::= Counter clone
      )
      response setCookie("ioweb", sessions register(session))
    )

    session handle(request, response)
  )
)

server start
