//  
//  LoginViewController.swift
//  iOS Meetup Munich
//
//  Created by Paul Kraft on 02.07.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Combine
import UIKit
import RxSwift
import XCoordinator
import XCoordinatorRx
import XCoordinatorCombine

enum LoginError: Error {
    case noPassword
}

class LoginViewController: UIViewController {

    // MARK: Views

    @IBOutlet private var passwordTextField: UITextField!

    // MARK: Stored properties

    var router: UnownedRouter<LoginRoute>!
    let disposeBag = DisposeBag()
    var cancelBag = Set<AnyCancellable>()

    // MARK: Overrides

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: IBActions

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let password = passwordTextField?.text ?? ""
        if password.isEmpty {
            router.trigger(.loginFailed)
        } else {
            router.trigger(.loginSuccessful)
        }

        /*
        print("before logging in")
        loginRx()
            .debug("before login transition")
            .flatMap { [unowned self] in self.router.rx.trigger(.loginSuccessful) }
            .catchError { [unowned self] _ in self.router.rx.trigger(.loginFailed) }
            .debug("after login transition")
            .subscribe()
            .disposed(by: disposeBag)
        */
    }

    // MARK: Helpers

    private func loginRx() -> Observable<Void> {
        let password = passwordTextField?.text ?? ""
        if password.isEmpty {
            return Observable
                .error(LoginError.noPassword)
                .delay(.seconds(1), scheduler: MainScheduler.asyncInstance)
        } else {
            return Observable
                .just(())
                .delay(.seconds(1), scheduler: MainScheduler.asyncInstance)
        }
    }

    private func loginCombine() -> AnyPublisher<Void, Error> {
        let password = passwordTextField?.text ?? ""
        if password.isEmpty {
            return Just(())
                .tryMap { throw LoginError.noPassword }
                .eraseToAnyPublisher()
        } else {
            return Just(())
                .mapError { _ -> Error in }
                .eraseToAnyPublisher()
        }
    }

}
