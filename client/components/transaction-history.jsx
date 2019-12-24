import React from 'react';
import {
  inDollars
} from './helper.js';

export default function TransactionHistory(props) {

  return (
    <React.Fragment>
      <div className="transContainer">

        <span className="trans-card-title transactionInputDate">{props.date}</span>
        {props.amount >= 0 ? (
          <span className="trans-amount plusTransaction transactionInputAmount">{inDollars(props.amount)}</span>)
          : (<span className="trans-amount minusTransaction transactionInputAmount">{inDollars(props.amount)}</span>
          )}
        <br></br>

      </div>

    </React.Fragment>
  );
}
