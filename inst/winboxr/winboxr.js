$(function () {
  Shiny.addCustomMessageHandler('create-winbox', function (data) {
    new WinBox({
        id: data.id,
        class: data.class,
        root: document.querySelector(data.root),
        title: data.title,
        background: data.background,
        border: data.border,
        width: data.width,
        height: data.height,
        x: data.x,
        y: data.y,
        max: data.max,
        splitscreen: data.splitscreen,
        top: data.top,
        right: data.right,
        bottom: data.bottom,
        left: data.left,
        html: data.html,
        mount: document.querySelector(data.mount).cloneNode(true),
        onresize: function(){
          var p = this.body.querySelector(".plotly");
          if(p) {
            setTimeout(Plotly.relayout, 200, p, {autosize: true})
          }
        }
      });
    console.log(`Winbox created`);
  });
});

var winboxBinding = new Shiny.InputBinding();

$.extend(winboxBinding, {

  find: function(scope) {
    return $(scope).parent().find(".winbox");
  },

  initialize: function(el){
  },

  getValue: function(el) {
    return {
      title: el.winbox.title,
      maximized: el.winbox.max,
      minimized: el.winbox.min,
      width: el.winbox.width,
      height: el.winbox.height,
      x: el.winbox.x,
      y: el.winbox.y
    }; // this will be a list in R
  },

   setValue: function(el, value){

      if (value === "minimize") {
        el.winbox.minimize()
      } else if (value === "maximize") {
        el.winbox.maximize()
      } else if (value === "fullscreen") {
        el.winbox.fullscreen()
      } else if (value === "close") {
        el.winbox.close()
      } else if (value === "force_close") {
        el.winbox.close(true)
      } else if(value.action === "update") {
         if (value.options.hasOwnProperty("title")) {
           el.winbox.setTitle(value.options.title);
         }

         if (value.options.hasOwnProperty("width") && value.options.hasOwnProperty("height")) {
           el.winbox.resize(value.options.width, value.options.width);
         } else if (value.options.hasOwnProperty("width")) {
            el.winbox.resize(value.options.width, el.winbox.height);
         } else if (value.options.hasOwnProperty("height")) {
            el.winbox.resize(el.winbox.width, value.options.height);
         }

         if (value.options.hasOwnProperty("x") && value.options.hasOwnProperty("y")) {
           el.winbox.move(value.options.x, value.options.y);
         } else if (value.options.hasOwnProperty("x")) {
            el.winbox.move(value.options.x, el.winbox.y);
         } else if (value.options.hasOwnProperty("y")) {
            el.winbox.move(el.winbox.x, value.options.y);
         }

         if (value.options.hasOwnProperty("color")) {
           el.winbox.setBackground(value.options.color);
         }

      }
     $(el).trigger("change");
  },

  receiveMessage: function(el, data) {
    this.setValue(el, data);
  },

  subscribe: function(el, callback) {
    $(el).on('change.winboxBinding', function(event){
      callback();
    });

    $(el).on('minimized.winbox', function(event){
      callback();
      Shiny.setInputValue(event.currentTarget.winbox.id + "_minimized", 1, {priority: "event"});
    });

    $(el).on('maximized.winbox', function(event){
      callback();
      Shiny.setInputValue(event.currentTarget.winbox.id + "_maximized", 1, {priority: "event"});
    });

    $(el).on('closed.winbox', function(event){
      callback();
      Shiny.setInputValue(event.currentTarget.winbox.id + "_closed", 1, {priority: "event"});
    });

  }

});

Shiny.inputBindings.register(winboxBinding);


