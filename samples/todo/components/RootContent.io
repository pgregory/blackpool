RootContent := Object clone do(
  init := method(
    menuComponent ::= MenuComponent clone
    menuComponent addEntry("All", block(self showAllTasks))
    menuComponent addEntry("Completed", block(self showCompletedTasks))
    menuComponent addEntry("Pending", block(self showPendingTasks))
    menuComponent addEntry("Missed", block(self showMissedTasks))
    listComponent ::= ListComponent clone do(
      renderItem := method(task, html,
        html tr with(
          html td with(html text(task deadline))
          html td with(html text(task taskName))
          html td with(html text(task taskDescription))
          html td with(html text(task completed))
        )
      )
      items append(Task clone do(
        deadline = Date clone copy(Date today setDay(Date today day - 1))
        taskName = "Missed Task"
      ))
      items append(Task clone do(
        deadline = Date clone copy(Date today setDay(Date today day + 2))
        taskName = "Pending Task"
      ))
      items append(Task clone do(
        deadline = Date clone copy(Date today setDay(Date today day + 1))
        taskName = "Already Completed"
        completed = true
      ))
    )
    taskEditor ::= TaskEditor clone
    taskEditor addTask := block( self addNewTask ) setIsActivatable(true) 
    showPendingTasks
    debugMsg ::= Sequence clone
    count ::= 0
  )
  
  showPendingTasks := method(
    listComponent filterBlock = block(items, items select(v, v isPending))
  )
  showAllTasks := method(
    listComponent filterBlock = block(items, items)
  )
  showCompletedTasks := method(
    listComponent filterBlock = block(items, items select(v, v completed))
  )
  showMissedTasks := method(
    listComponent filterBlock = block(items, items select(v, v isMissed))
  )
  addNewTask := method(
    if(taskEditor task isValid,
      listComponent items append(
        taskEditor task
      )
    )
  )

  renderOn := method(html,
    html h1 with(html text("Todo-List"))
    html div with(html render(menuComponent))
    html div with(html render(listComponent))
    html div with(html render(taskEditor))
    html text(debugMsg)
  )
)


