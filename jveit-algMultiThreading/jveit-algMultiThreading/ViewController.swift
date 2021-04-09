//
//  ViewController.swift
//  jveit-algMultiThreading
//
//  Created by Jeffrey Veit on 4/6/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var arraySize: UISegmentedControl!
    @IBOutlet weak var sortOne: UISegmentedControl!
    @IBOutlet weak var sortTwo: UISegmentedControl!
    
    var N = [Int]()
    var Q = [Int]()
    var size = [16, 32, 48, 64]
    let myQueue = DispatchQueue(label: "worker1")
    let container = UIView()
    let container2 = UIView()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let w = 350
        let h = 210
        container.frame = CGRect(x: 25, y: 250, width: w, height: h)
        container2.frame = CGRect(x: 25, y: 600, width: w, height: h)
        view.addSubview(container)
        view.addSubview(container2)
       
        let arrSize = 16
        N = [Int](repeating: 0, count:arrSize)
        Q = [Int](repeating: 0, count:arrSize)
        for i in 0 ..< arrSize
            {
                N[i] = i + 1
                Q[i] = i + 1
            }
        shuffle(&N)
        shuffle(&Q)
        print(N)
        print(Q)
    }
    
    @IBAction func arrayChange(_ sender: UISegmentedControl)
    {
        let index = arraySize.selectedSegmentIndex
        let arrSize = size[index]
        N = [Int](repeating: 0, count:arrSize)
        Q = [Int](repeating: 0, count:arrSize)
        for i in 0 ..< arrSize
            {
                N[i] = i + 1
                Q[i] = i + 1
            }
        shuffle(&N)
        shuffle(&Q)
        print(N)
        print(Q)
        
    }
    
    @IBAction func sortOneChange(_ sender: UISegmentedControl)
    {
        let index = sortOne.selectedSegmentIndex
        let index2 = sortTwo.selectedSegmentIndex
        
        myQueue.async
        { [self] in
            
            switch index
            {
                case 0: insertionSort(&N, "N")
                case 1: selectionSort(&N, "N")
                case 2: quickSort(&N, 0, N.count - 1, "N")
                case 3: bubbleSort(&N, "N")
                default: print("Error")
            }
            
            switch index2
            {
                case 0: insertionSort(&Q, "Q")
                case 1: selectionSort(&Q, "Q")
                case 2: quickSort(&Q, 0, Q.count - 1, "Q")
                case 3: bubbleSort(&Q, "Q")
                default: print("Error")
            }
            
            print(N)
            print(Q)
        }
       
    }
    
    // Shuffling algorithm for creating random numbers in array to sort
    func shuffle(_ a: inout [Int])
    {
        let N = a.count
        for i in 0 ..< N
        {
            let r = Int(arc4random_uniform(UInt32(i + 1)))
            a.swapAt(i, r)
        }
    }
    
    // Insertion sort algorithm
    func insertionSort(_ a: inout [Int], _ set: String)
    {
        var arr = [Int]()
        for i in 0 ..< a.count
        {
            var j = i
            while j > 0 && a[j-1] > a[j]
            {
                a.swapAt(j-1, j)
                j -= 1
            }
            arr.append(i)
        }
        update(arr, set)
    }
    
    // Selection sort algorithm
    func selectionSort(_ a: inout [Int], _ set: String) {
        var arr = [Int]()
        for i in 0..<a.count - 1
        {
            var k = i
            for j in i + 1..<a.count where a[j] < a[k]
            {
                k = j
            }
            if k != i
            {
                a.swapAt(k, i)
            }
            arr.append(i)
        }
        update(arr, set)
    }
    
    // Bubble sort algorithm
    func bubbleSort (_ a: inout [Int], _ set: String)
    {
        var arr = [Int]()
        for i in 0..<a.count
        {
            for j in 0..<a.count-i-1
            {
                if a[j] > a[j + 1]
                {
                    a.swapAt(j + 1, j)
                }
            }
            arr.append(i)
        }
        update(arr, set)
        
    }
    
    // Quick sort algorithm
    func quickSort(_ a: inout [Int], _ startIndex: Int, _ endIndex: Int, _ set: String)
    {
        var arr = [Int]()
        var i = startIndex
        var j = endIndex
        arr.append(i)

        let piv = (startIndex + (endIndex - startIndex) / 2)
        let pivot_location = a[piv]

        while i <= j
        {
            while a[i] < pivot_location
            {
                i+=1
            }
            
            while a[j] > pivot_location
            {
                j-=1
            }

            if i <= j
            {
                let temp = a[i]
                a[i] = a[j]
                a[j] = temp
                i+=1
                j-=1
            }
            
        }
        
        update(arr, set)

        if startIndex < j
        {
            quickSort(&a, startIndex, j, set)
        }
        
        if i < endIndex
        {
            quickSort(&a, i, endIndex, set)
        }
    }
    
    
    
    func clear(_ set: String)
    {
        
        if set == "N"
        {
            for subUIView in self.container.subviews
            {
                subUIView.removeFromSuperview()
            }
        }
        
        else if set == "Q"
        {
            for subUIView in self.container2.subviews
            {
                subUIView.removeFromSuperview()
            }
        }
        
    }
    
    func update (_ a: [Int], _ set: String)
    {
        DispatchQueue.main.async
        { [self] in
            
            clear(set)
            let x = 16
            for i in 0..<a.count
                    {
                       if i == 23
                       {
                            break
                       }
                        
                       switch set
                       {
                            case "N":
                                print("NNNNN")
                                let bar = animationView()
                                bar.drawish(x * i, a[i] * 5)
                                bar.translatesAutoresizingMaskIntoConstraints = false
                                container.addSubview(bar)
                            case "Q":
                                print("QQQ")
                                let bar = animationView()
                                bar.drawishBelow(x * i, a[i] * 5)
                                bar.translatesAutoresizingMaskIntoConstraints = false
                                container2.addSubview(bar)
                            default: print("error")
                       }
                       
                   }
            
        }
        
    }
    
}

