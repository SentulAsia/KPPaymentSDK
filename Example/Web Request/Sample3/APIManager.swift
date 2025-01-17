//  Copyright © 2019 Kiple Sdn Bhd. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  1. Redistributions of source code must retain the above copyright notice, this
//     list of conditions and the following disclaimer.
//
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//
//  3. Neither the name of the copyright holder nor the names of its
//     contributors may be used to endorse or promote products derived from
//     this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import Foundation

struct APIManager {
    static let shared = APIManager()

    private init() {}

    func postGenerateDeeplink(
        deeplinkObj: Deeplink,
        success: @escaping (_ deeplinkModelObj: Deeplink) -> Void,
        failure: @escaping (_ serverError: String) -> Void
        ) {
        let generateDeeplinkURLString = Constant.generateDeeplinkURL
        let headers = ["Content-Type": "application/json"]
        if let generateDeeplinkURL = URL(string: generateDeeplinkURLString) {
            APIWorker.request(url: generateDeeplinkURL, method: .post, parameters: deeplinkObj.toDictionary(), headers: headers) { (response) in
                guard response.result.isSuccess else {
                    failure((response.result.error?.localizedDescription)!)
                    return
                }

                guard let value = response.result.value,
                    let responseDictionary = value as? [String: Any] else {
                        failure(Constant.Message.failureDefault)
                        return
                }

                let deeplinkModelObj = Deeplink(fromDictionary: responseDictionary)

                if deeplinkModelObj.deeplinkURL == nil {
                    let message = deeplinkModelObj.message ?? Constant.Message.failureDefault
                    failure(message)
                    return
                } else {
                    success(deeplinkModelObj)
                    return
                }
            }
        }
    }
}
