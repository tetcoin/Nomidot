// Copyright 2018-2020 @paritytech/Nomidot authors & contributors
// This software may be modified and distributed under the terms
// of the Apache-2.0 license. See the LICENSE file for details.

import { ApiRx } from '@polkadot/api';
import { DeriveFees } from '@polkadot/api-derive/types';
import { EraIndex } from '@polkadot/types/interfaces';
import { logger } from '@polkadot/util';
import React, { useEffect, useState } from 'react';
import { take } from 'rxjs/operators';

import { ApiRxContextProviderProps } from './types';
import { useDidUpdateEffect } from './util';

export interface ApiRxContextType {
  api: ApiRx; // From @polkadot/api
  bondingDuration?: EraIndex;
  fees?: DeriveFees;
  isApiReady: boolean;
}

const l = logger('api-context');

export const ApiRxContext: React.Context<ApiRxContextType> = React.createContext(
  {} as ApiRxContextType
);

export function ApiRxContextProvider(
  props: ApiRxContextProviderProps
): React.ReactElement {
  const { children = null, provider } = props;
  const [apiRx, setApiRx] = useState<ApiRx>(new ApiRx({ provider }));
  const [bondingDuration, setBondingDuration] = useState<EraIndex>();
  const [fees, setFees] = useState<DeriveFees>();
  const [isReady, setIsReady] = useState(false);

  useDidUpdateEffect(() => {
    // We want to fetch all the information again each time we reconnect. We
    // might be connecting to a different node, or the node might have changed
    // settings.
    setApiRx(new ApiRx({ provider }));
    setIsReady(false);
  }, [provider]);

  useEffect(() => {
    // We want to fetch all the information again each time we reconnect. We
    // might be connecting to a different node, or the node might have changed
    // settings.
    const subscription = apiRx.isReady.subscribe(() => {
      l.log(`Api ready.`);

      setIsReady(true);
    });

    return (): void => subscription.unsubscribe();
  }, [apiRx.isReady]);

  useEffect(() => {
    if (isReady) {
      const subscription = apiRx.derive.balances
        .fees()
        .pipe(take(1))
        .subscribe(derivedFees => {
          setFees(derivedFees);
        });

      const duration = apiRx.consts.staking.bondingDuration;
      setBondingDuration(duration);

      return (): void => subscription.unsubscribe();
    }
  }, [isReady]);

  return (
    <ApiRxContext.Provider
      value={{ api: apiRx, bondingDuration, fees, isApiReady: isReady }}
    >
      {children}
    </ApiRxContext.Provider>
  );
}
