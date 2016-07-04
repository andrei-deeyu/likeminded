const React = require('react');
const AnswerActions = require('../actions/answer_actions');
const TestResult = require('../components/test_result');

const QuestionIndexItem = React.createClass({
  getInitialState(){
    return { answerChoice: 0 };
  },

  handleClick(e){
    this.setState({ answerChoice: e.target.value });
  },

  handleSubmit(e){
    e.preventDefault();
    const formData = { question_id: this.props.question.id, answer_choice: this.state.answerChoice };
    AnswerActions.createAnswer(formData);
    this.props.incrementCurrIdx();
  },

  render(){
    // if (this.props.currIdx === this.props.questions.length) {
    //   return (<TestResult resetCurrIdx={this.props.resetCurrIdx}/>);
    // };
    return(
      <form onSubmit={this.handleSubmit}>
        <span>Question {this.props.question.id}/60</span><br/>
        <span>{this.props.question.content}</span><br/>
        <input type="radio" value="1" onClick={this.handleClick}/>Strongly Dislike<br/>
        <input type="radio" value="2" onClick={this.handleClick}/>Dislike<br/>
        <input type="radio" value="3" onClick={this.handleClick}/>Unsure<br/>
        <input type="radio" value="4" onClick={this.handleClick}/>Like<br/>
        <input type="radio" value="5" onClick={this.handleClick}/>Strongly Like<br/>
        <input type="submit" value="Answer"/>
      </form>
    )
  }
})
module.exports = QuestionIndexItem;