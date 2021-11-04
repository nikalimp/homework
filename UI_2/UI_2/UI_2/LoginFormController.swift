//  LoginFormController.swift
//  UI_2
//  Created by Никита Алимпиев on 04.11.2021.

import UIKit

class LoginFormController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    // Жест нажатия
    let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
    // Присваиваем его UIScrollVIew
    scrollView?.addGestureRecognizer(hideKeyboardGesture)

    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBAction func loginButtomPressed(_ sender: Any) {
    // Получаем текст логина
    let login = loginInput.text!
    // Получаем текст-пароль
    let password = passwordInput.text!
    // Проверяем, верны ли они
    if login == "admin" && password == "123456" {
    print("успешная авторизация")
    } else {
    print("неуспешная авторизация")
    }
    }
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
    let info = notification.userInfo! as NSDictionary
    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
    // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
    self.scrollView?.contentInset = contentInsets
    scrollView?.scrollIndicatorInsets = contentInsets
}
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
    // Устанавливаем отступ внизу UIScrollView, равный 0
    let contentInsets = UIEdgeInsets.zero
    scrollView?.contentInset = contentInsets
    }
    //Теперь надо подписаться на сообщения из центра уведомлений, которые рассылает клавиатура:
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
    // Второе — когда она пропадает
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //Центр уведомлений будем рассматривать позже. А сейчас отметим, что от уведомлений надо отписываться, когда они не нужны. Добавим метод отписки при исчезновении контроллера с экрана.
    override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func hideKeyboard() {
    self.scrollView?.endEditing(true)
    }
}
