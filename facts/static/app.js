


var HelloText = React.createClass({
          render: function() {
            return (
            <div>
              <h3>Hello, {this.props.data}</h3>
            </div>
            );
          }
      });

ReactDOM.render(<HelloText/> , document.getElementById('content'));
