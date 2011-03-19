TaskEditor := Object clone do(
  init := method(
    task ::= Task clone
  )

  renderOn := method(html,
    html div with(
      html form with(
        html table with(
          html tr with(self renderNameInputOn(html))
          html tr with(self renderDescriptionInputOn(html))
          html tr with(self renderDateInputOn(html))
          html tr with(self renderCompletedSelectionOn(html))
          html tr with(self renderButtonsOn(html))
        )
      )
    )
  )

  renderNameInputOn := method(html,
    html td with(html label addAttribute("for", "name") with(html text("Name:")))
    html td with(html inputText callback(block(value, task taskName = value)) with())
  )

  renderDescriptionInputOn := method(html,
    html td with(html label addAttribute("for", "description") with(html text("Description:")))
    html td with(html inputText callback(block(value, task taskDescription = value)) with())
  )

  renderDateInputOn := method(html,
    html td with(html label addAttribute("for", "date") with(html text("Date:")))
    html td with(html inputDate callback(block(value, task deadline fromString(value, "%Y-%m-%d"))) with())
  )

  renderCompletedSelectionOn := method(html,
    html td with(html label addAttribute("for", "completed") with(html text("Completed:")))
    html td with(html select with(
        html option addAttribute("value", "yes") with(html text("yes"))
        html option addAttribute("value", "no") addAttribute("selected", "selected") with(html text("no"))
      )
    )
  )

  renderButtonsOn := method(html,
    html td with(html space)
    html td with(html button("Save", block(self addTask))  
            html button("Cancel", block()))
  )
)

