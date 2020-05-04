// Copyright 2018-2020 @paritytech/Nomidot authors & contributors
// This software may be modified and distributed under the terms
// of the Apache-2.0 license. See the LICENSE file for details.

import { ApiRxContext, TxQueueContext } from '@substrate/context';
import { Input } from '@substrate/ui-components';
import BN from 'bn.js';
import React, { useCallback, useContext, useState } from 'react';
import Dropdown from 'semantic-ui-react/dist/commonjs/modules/Dropdown';
import Modal from 'semantic-ui-react/dist/commonjs/modules/Modal'

import { Button, ClosableTooltip, Text } from './index';

const BondExtraModal = () => {
  const { api } = useContext(ApiRxContext);
  const { enqueue, signAndSubmit } = useContext(TxQueueContext);
  const [maxAdditional, setMaxAdditional] = useState(new BN(0));

  const submitBondExtra = useCallback(() => {
    const extrinsic = api.tx.staking.bondExtra(maxAdditional);

  
  }, []);

  const handleUserInputChange = useCallback(({ target: { value }}) => {
    setMaxAdditional(new BN(value));
  }, []);

  return (
    <Modal
      closeIcon
      closeOnDimmerClick
      dimmer
      open
      trigger={
       <Dropdown.Item text='Bond More Funds' />
      }
    >
      <Modal.Header>Bond More Funds</Modal.Header>
      <ClosableTooltip>
        <Text>
          Bonding more funds means you are increasing the amount of KSM bonded from your Stash account to be used by your Controller.
        </Text>
        <Text>
          Tip: You should only bond as much as you intend to use for nominating, as you don't want to unnecessarily put funds at risk.
        </Text>
      </ClosableTooltip>
      <Modal.Content>
        <Input
          fluid
          label='UNIT'
          labelPosition='right'
          min={0}
          onChange={handleUserInputChange}
          placeholder='e.g. 1.00'
          type='number'
          value={maxAdditional}
        />
      </Modal.Content>

      <Modal.Description>
        <Button primary onClick={submitBondExtra}>Bond Extra</Button>
      </Modal.Description>
    </Modal>
  )
}

export default React.memo(BondExtraModal);