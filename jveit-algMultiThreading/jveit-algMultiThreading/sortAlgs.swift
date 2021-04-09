//
//  sortAlgs.swift
//  jveit-algMultiThreading
//
//  Created by Jeffrey Veit on 4/8/21.
//

import Foundation


// All algorithms perform an inplace sort using 'inout'
// Insertion sort algorithm




// Quick sort algorithm
func quickSort(_ a: inout [Int], _ startIndex: Int, _ endIndex: Int)
{
    var i = startIndex
    var j = endIndex

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

    if startIndex < j
    {
        quickSort(&a, startIndex, j)
    }
    
    if i < endIndex
    {
        quickSort(&a, i, endIndex)
    }
}


