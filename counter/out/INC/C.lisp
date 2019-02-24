(forall ((A opposite_s))
       (let ((a!1 (or (not imp[1])
                      (not v[1])))
             (a!2 (or (not imp[0])
                      (not v[0])))
             (a!3 (or (not imp[3])
                      (not v[3])))
             (a!4 (or (not imp[2])
                      (not v[2]))))
       (let ((a!5 (and (or v[3]
                           imp[3])
                       (or v[0]
                           imp[0])
                       a!1
                       (or v[1]
                           imp[1])
                       a!2
                       a!3
                       (or v[2]
                           imp[2])
                       a!4)))
         (= (INV1 A) a!5))))