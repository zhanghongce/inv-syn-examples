(forall ((A wrapper_s))
       (let ((a!1 (bvadd #xf (bvmul #xf m1.imp)))
             (a!4 (not m1.v[0]))
             (a!5 (not m1.imp[0]))
             (a!6 (not m1.v[1]))
             (a!7 (not m1.imp[1]))
             (a!8 (or m1.v[0]
                      m1.imp[0]))
             (a!9 (or m1.v[1]
                      m1.imp[1]))
             (a!10 (or (not (= __START__ #b1))
                       (not (= __STARTED__ #b1))))
             (a!11 (or m1.v[2]
                       m1.imp[2]))
             (a!12 (not m1.v[3]))
             (a!13 (not m1.imp[3]))
             (a!14 (not m1.v[2]))
             (a!15 (not m1.imp[2]))
             (a!16 (or m1.v[3]
                       m1.imp[3]))
             (a!17 (or (= m1__DOT__out __ILA_SO_v)
                       (not (= __START__ #b0))
                       (not (= __CYCLE_CNT__ #x1))))
             (a!18 (not (= __ILA_SO_v[0] #b1)))
             (a!19 (= m1.v[0] #b1))
             (a!20 (or __CYCLE_CNT__[3]
                       (not (= __START__ #b0))
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]))
             (a!21 (or __ILA_SO_v[3]
                       m1.imp[3]
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]
                       __CYCLE_CNT__[3]))
             (a!22 (not (= __ILA_SO_v[1] #b1)))
             (a!24 (= m1.imp[1] #b1))
             (a!26 (not (= __ILA_SO_v[3] #b1)))
             (a!28 (or m0.v[2]
                       m1.imp[2]
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]
                       __CYCLE_CNT__[3]))
             (a!29 (or m0.v[0]
                       m1.imp[0]
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]
                       __CYCLE_CNT__[3]))
             (a!30 (or m1__DOT__out[2]
                       (not __ILA_SO_v[2])
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]
                       __CYCLE_CNT__[3])))
       (let ((a!2 (bvor (bvnot m1.v) (bvnot a!1)))
             (a!23 (or a!22
                       m1.v[1]
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]
                       __CYCLE_CNT__[3]))
             (a!25 (or a!24
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]
                       __CYCLE_CNT__[3]
                       m0.v[1]))
             (a!27 (or a!26
                       m1.v[3]
                       __CYCLE_CNT__[0]
                       __CYCLE_CNT__[1]
                       __CYCLE_CNT__[2]
                       __CYCLE_CNT__[3])))
       (let ((a!3 (or (= (bvnot a!2) m0.v)
                      (not (= __START__ #b0))
                      __CYCLE_CNT__[1]
                      __CYCLE_CNT__[2]
                      __CYCLE_CNT__[3])))
       (let ((a!31 (and a!3
                        (or a!4 a!5)
                        (or a!6 a!7)
                        a!8
                        a!9
                        a!10
                        a!11
                        (or a!12 a!13)
                        (or a!14 a!15)
                        a!16
                        a!17
                        (or a!18
                            __CYCLE_CNT__[0]
                            __CYCLE_CNT__[1]
                            __CYCLE_CNT__[2]
                            __CYCLE_CNT__[3]
                            a!19)
                        (or __CYCLE_CNT__[3]
                            __ILA_counter_decode_of_INC__
                            __CYCLE_CNT__[0]
                            __CYCLE_CNT__[1]
                            __CYCLE_CNT__[2])
                        a!20
                        a!21
                        a!23
                        a!25
                        a!27
                        a!28
                        a!29
                        a!30)))
         (= (INV2 A) a!31))))))
