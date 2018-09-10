// load the mindmap
$(document).ready(function() {
  // enable the mindmap in the body
  $('body').mindmap();

  // add the data to the mindmap
  var root = $('body>div>div>ul>li').get(0).mynode = $('body').addRootNode($('body>div>div>ul>li>div').text(), {
    href:'/',
    url:'/',
    onclick:function(node) {
      $(node.obj.activeNode.content).each(function() {
        //this.hide();
      });
    }
  });
  //$('body>div>div>ul>li').hide();
  var addLI = function() {
    var parentnode = $(this).parents('li').get(0);
    if (typeof(parentnode)=='undefined') parentnode=root;
      else parentnode=parentnode.mynode;
    
    this.mynode = $('body').addNode(parentnode, $('div:eq(0)',this).text(), {
//          href:$('a:eq(0)',this).text().toLowerCase(),
      href:$('div:eq(0)',this).attr('href'),
      onclick:function(node) {
        $(node.obj.activeNode.content).each(function() {
          //this.hide();
        });
        $(node.content).each(function() {
          this.show();
        });
      }
    });
    //$(this).hide();
    $('>ul>li', this).each(addLI);
  };
  $('body>div>div>ul>li>ul').each(function() { 
    $('>li', this).each(addLI);
  });

});   