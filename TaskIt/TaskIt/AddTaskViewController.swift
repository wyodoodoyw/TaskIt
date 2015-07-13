//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Matthew Wood on 2015-07-05.
//  Copyright (c) 2015 Matthew. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    // Allows us to pass the instance of our VC to our addTaskViewController and have access to it there
    var mainVC: ViewController!
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTaskButtonPressed(sender: AnyObject) {
        var task = TaskModel(task: taskTextField.text, subTask: subtaskTextField.text, date: dueDatePicker.date, completed: false)
        // mainVC has a property taskArray that we can add our task to
        mainVC.baseArray[0].append(task)
        // when the user presses the add button, the task is presented in the tableView (after a reload)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
