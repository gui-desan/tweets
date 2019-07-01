// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(document).ready(function () {
  let state = 0

  const run = () => {
    if (state == -1) {
      setTitle('Results')
      showResult()
      hideContent()
      showBtn1()
      hideBtn2()
      setBtn1('New game')
      setBtn2('')
      btn1Click(() => {
        changeToState(0)
      })
    } else if (state == 0) {
      setTitle('Life Simulator')
      setContent(
        'Welcome to Life Simulator game.',
        'Press <strong>start</strong> to begin.',
      )
      hideResult()
      showContent()
      showBtn1()
      hideBtn2()
      setBtn1("Start")
      setBtn2("")
      btn1Click(() => {
        addResult("Born in Thailand.")
        changeToState(1)
      })
    } else if (state == 1) {
      setTitle("Ages 0")
      setContent(
        'You have born in Thailand.',
        'Doctor tell your mom about your health condition.',
        'Don\'t worry, you did\'t get any deseases and very healthy.',
      )
      showBtn1()
      hideBtn2()
      setBtn1('Continue')
      setBtn2("")
      btn1Click(() => {
        changeToState(2)
      })
    } else if (state == 2) {
      setTitle("Ages 3")
      setContent(
        'At ages 3, your mom didn\'t feed you for a while and you are very hungry.',
        'What should you do?',
      )
      showBtn1()
      showBtn2()
      setBtn1('Burst cry!!!')
      setBtn2('Do nothing')
      btn1Click(() => {
        addResult('Break mom\'s eardrum when hungry at ages 3.')
        changeToState(3.1)
      })
      btn2Click(() => {
        addResult('Almost got starve to death at ages 3.')
        changeToState(3.2)
      })
    } else if (state == 3.1) {
      setTitle("Ages 3")
      setContent(
        'Suddenly, your mom realizes that she forgot to feed you and goes to prepare a meal for you.',
        'You sleep well after enjoy a meal.',
      )
      showBtn1()
      hideBtn2()
      setBtn1('Continue')
      setBtn2('')
      btn1Click(() => {
        changeToState(4)
      })
    } else if (state == 3.2) {
      setTitle("Ages 3")
      setContent(
        'It tooks very long time before your mom give you a food, you would die if she is too late',
        'At least, you survives from starvation and a food is taste good.',
      )
      showBtn1()
      hideBtn2()
      setBtn1('Continue')
      setBtn2('')
      btn1Click(() => {
        changeToState(4)
      })
    } else if (state == 4) {
      setTitle("Ages 8")
      setContent(
        'While you\'re playing a game, you sees something sneaking into your house.',
        'Python!! A huge python!!',
        'It\'s big enough to devour you up.',
        'What should you do in this danger situation?',
      )
      showBtn1()
      showBtn2()
      setBtn1('Call for a police')
      setBtn2('Run away')
      btn1Click(() => {
        addResult('Died at ages 8. Cause of death: Devoured by a huge python.')
        changeToState(5.1)
      })
      btn2Click(() => {
        addResult('A huge python sneaks into house at ages 8, but it was caught by a police.')
        changeToState(5.2)
      })
    } else if (state == 5.1) {
      setTitle('The End')
      setContent(
        'Python see you as nothing but a food, you were caught and devoured by a huge python while calling a police with a phone',
        'How unfortunate, you would run away if you know it will ended up like this but you didn\'t carefully think about it.',
        'This is the end of your life.',
        '(Total ages: 8)',
      )
      showBtn1()
      hideBtn2()
      setBtn1('See results')
      setBtn2('')
      btn1Click(() => {
        changeToState(-1)
      })
    } else if (state == 5.2) {
      setTitle("Ages 8")
      setContent(
        'You manages to flee from python by going upstair with a fear inside your mind.',
        '\"What happened, boi?\"',
        'Your dad rushes to you and asks.',
        'You told him about that python, he called a police to capture it.',
        'Now python is gone and you\'re survive this day.',
      )
      showBtn1()
      hideBtn2()
      setBtn1('Continue')
      setBtn2('')
      btn1Click(() => {
        addResult('Died at ages 10. Cause of death: Crashed by satellite.')
        changeToState(6)
      })
    } else if (state == 6) {
      setTitle("The End")
      setContent(
        'One of satellites got malfunctioned and fell directly to your house.',
        'You got crashed by satellite and died instantly.',
        'Life is a kinds of luck-base and you just unlucky this time.',
        'This is the end of your life.',
        '(Total ages: 10)',
      )
      showBtn1()
      hideBtn2()
      setBtn1('See results')
      setBtn2('')
      btn1Click(() => {
        changeToState(-1)
      })
    }
  }

  const changeToState = newState => {
    state = newState
    run()
  }

  const setTitle = (title) => {
    $('#life-simulator #game-title').html(`<h3>${title}</h3>`)
  }

  const setContent = (first, ...rests) => {
    $('#life-simulator #game-content').html(`<p>${first}</p>`)
    rests.forEach(rest => {
      $('#life-simulator #game-content').append(`<p>${rest}</p>`)
    })
  }

  const showContent = () => {
    $('#life-simulator #game-content').show()
  }

  const hideContent = () => {
    $('#life-simulator #game-content').hide()
  }

  const showBtn1 = () => {
    $('#life-simulator #game-button #btn1').show()
  }

  const showBtn2 = () => {
    $('#life-simulator #game-button #btn2').show()
  }

  const hideBtn1 = () => {
    $('#life-simulator #game-button #btn1').hide()
  }

  const hideBtn2 = () => {
    $('#life-simulator #game-button #btn2').hide()
  }

  const setBtn1 = text => {
    $('#life-simulator #game-button #btn1').html(text)
  }

  const setBtn2 = text => {
    $('#life-simulator #game-button #btn2').html(text)
  }

  const btn1Click = onClick => {
    $('#life-simulator #game-button #btn1').click(onClick)
  }
  
  const btn2Click = onClick => {
    $('#life-simulator #game-button #btn2').click(onClick)
  }

  const addResult = res => {
    $('#life-simulator #game-results').append(`<p>${res}</p>`)
  }

  const showResult = () => {
    $('#life-simulator #game-results').show()
  }

  const hideResult = () => {
    $('#life-simulator #game-results').hide()
  }

  run()
})
