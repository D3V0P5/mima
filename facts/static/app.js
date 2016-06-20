
var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox">
        Hello, world! I am a CommentBox.
      </div>
    );
  }
});
ReactDOM.render(
  <CommentBox />,
  document.getElementById('content')
);


/*
ReactDOM.render(
  <h1>Hello, world!</h1>,
  document.getElementById('example')
);
*/
/*
var Hello = React.createClass({
  render : function() {
    return (<div><h1>Hello</h1></div>);
  }
});


var HelloText = React.createClass({
          render: function() {
            return (
            <div>
              <h3>Hello, {this.props.data}</h3>
            </div>
            );
          }
      });

React.render(<Hello/> ,mountNode);
*/
