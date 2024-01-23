// @flow

export default class ErnNavigationRequests {
  _bridge: Object;

  constructor(bridge: Object) {
    this._bridge = bridge;
  }

  /**
   * Registers a handler for a particular api. This allows JavaScript to handle a request from native.
   * @param handler The handler function, taking a single parameter being the data of the request and returning a Promise. Implementer of the handler should either resolve the promise with an object being the response data (if any) or reject the promise with an Error
   */
  registerNavigateRequestHandler(handler: Function) {
    this._bridge.registerRequestHandler(
      'com.ewalletnavigation.ern.api.request.navigate',
      handler,
    );
  }

  /**
   * @param  route Route object that details where to navigate next
   * @param timeout timeout in milliseconds
   * @return {Promise} a {@link https://www.promisejs.org/|Promise}
   */
  navigate(route: any, timeout: number): Promise<any> {
    return this._bridge.sendRequest('com.ewalletnavigation.ern.api.request.navigate', {
      data: route,
      timeout,
    });
  }
}
