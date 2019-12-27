import React from 'react';

function Onboarding(props) {
  return (
    <React.Fragment>
      <div className="onBoarding" >
        <p className="someStatement">Save Smarter</p>
        <img src="/images/piggybank.png" className="logo"></img>

        <p className="getStartedNow">Set Goals</p>

        <p className="secondStatement">Save money for the things you want</p>

        <div className="getStartedButton"
          onClick={() => props.setView('creategoal', {})}> <p className="getStartedText">Get Started</p> </div>
      </div>
    </React.Fragment>
  );

}

export default Onboarding;
