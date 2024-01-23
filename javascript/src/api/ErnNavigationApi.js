import {electrodeBridge} from 'react-native-electrode-bridge';

import ErnNavigationRequests from './ErnNavigationRequests';

const REQUESTS = new ErnNavigationRequests(electrodeBridge);

export function requests() {
  return REQUESTS;
}

export default {requests};
