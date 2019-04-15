(set-option :fp.engine spacer)

;----------------------------------------
;  Single Inductive Invariant Synthesis
;  Generated from ILAng
;----------------------------------------

; SMT-LIBv2 description generated by Yosys 0.8+132 (git sha1 86a5adf9, gcc 7.3.0-27ubuntu1~18.04 -fPIC -Os)
; yosys-smt2-stdt
; yosys-smt2-module wrapper
; yosys-smt2-input __ILA_I_en 1
; yosys-smt2-wire __ILA_I_en 1
(define-fun |wrapper_n __ILA_I_en| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool |wrapper#0|)
; yosys-smt2-output __ILA_SO_v 4
; yosys-smt2-wire __ILA_SO_v 4
(define-fun |wrapper_n __ILA_SO_v| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) |wrapper#1|)
; yosys-smt2-output __all_assert_wire__ 1
; yosys-smt2-wire __all_assert_wire__ 1
(define-fun |wrapper#3| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool (= |wrapper#2| #b0010)) ;  $eq$/home/hongce/ila/ILA-Tools/test/unit-data/inv_syn/cnt2-cegar/inv-syn/wrapper.v:37$1_Y
(define-fun |wrapper#5| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool (= |wrapper#4| #b0010)) ;  $eq$/home/hongce/ila/ILA-Tools/test/unit-data/inv_syn/cnt2-cegar/inv-syn/wrapper.v:37$3_Y
(define-fun |wrapper#6| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool (and (or  (|wrapper#3| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|) false) (or  (|wrapper#5| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|) false))) ;  $logic_and$/home/hongce/ila/ILA-Tools/test/unit-data/inv_syn/cnt2-cegar/inv-syn/wrapper.v:37$4_Y
(define-fun |wrapper#7| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 1) (bvnot (ite (|wrapper#6| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|) #b1 #b0))) ;  \cex_nonreachable_assert__p0__
(define-fun |wrapper_n __all_assert_wire__| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool (= ((_ extract 0 0) (|wrapper#7| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|)) #b1))
; yosys-smt2-output cex_nonreachable_assert__p0__ 1
; yosys-smt2-wire cex_nonreachable_assert__p0__ 1
(define-fun |wrapper_n cex_nonreachable_assert__p0__| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool (= ((_ extract 0 0) (|wrapper#7| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|)) #b1))
; yosys-smt2-input clk 1
; yosys-smt2-wire clk 1
; yosys-smt2-clock clk posedge
(define-fun |wrapper_n clk| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool |wrapper#8|)
; yosys-smt2-wire m1.clk 1
; yosys-smt2-clock m1.clk posedge
(define-fun |wrapper_n m1.clk| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool |wrapper#8|)
; yosys-smt2-wire m1.en 1
(define-fun |wrapper_n m1.en| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool |wrapper#0|)
; yosys-smt2-register m1.imp 4
; yosys-smt2-wire m1.imp 4
(define-fun |wrapper_n m1.imp| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) |wrapper#2|)
; yosys-smt2-wire m1.m1__DOT__imp 4
(define-fun |wrapper_n m1.m1__DOT__imp| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) |wrapper#2|)
; yosys-smt2-wire m1.m1__DOT__v 4
(define-fun |wrapper_n m1.m1__DOT__v| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) |wrapper#4|)
; yosys-smt2-wire m1.out 4
(define-fun |wrapper#9| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (bvsub #b1111 |wrapper#2|)) ;  $techmap\m1.$sub$/home/hongce/ila/ILA-Tools/test/unit-data/inv_syn/cnt2-cegar/inv-syn/wrapper.v:72$11_Y
(define-fun |wrapper#10| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (bvand |wrapper#4| (|wrapper#9| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|))) ;  \m1.out
(define-fun |wrapper_n m1.out| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (|wrapper#10| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|))
; yosys-smt2-wire m1.rst 1
(define-fun |wrapper_n m1.rst| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool |wrapper#11|)
; yosys-smt2-register m1.v 4
; yosys-smt2-wire m1.v 4
(define-fun |wrapper_n m1.v| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) |wrapper#4|)
; yosys-smt2-output m1__DOT__imp 4
; yosys-smt2-wire m1__DOT__imp 4
(define-fun |wrapper_n m1__DOT__imp| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) |wrapper#2|)
; yosys-smt2-output m1__DOT__v 4
; yosys-smt2-wire m1__DOT__v 4
(define-fun |wrapper_n m1__DOT__v| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) |wrapper#4|)
; yosys-smt2-output out 4
; yosys-smt2-wire out 4
(define-fun |wrapper_n out| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (|wrapper#10| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|))
; yosys-smt2-input rst 1
; yosys-smt2-wire rst 1
(define-fun |wrapper_n rst| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool |wrapper#11|)
; yosys-smt2-assert 0 /home/hongce/ila/ILA-Tools/test/unit-data/inv_syn/cnt2-cegar/inv-syn/wrapper.v:47
(define-fun |wrapper_a 0| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool (or (= ((_ extract 0 0) (|wrapper#7| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|)) #b1) (not true))) ;  $assert$/home/hongce/ila/ILA-Tools/test/unit-data/inv_syn/cnt2-cegar/inv-syn/wrapper.v:47$6
(define-fun |wrapper#12| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (bvadd |wrapper#4| #b0001)) ;  $techmap\m1.$add$/home/hongce/ila/ILA-Tools/test/unit-data/inv_syn/cnt2-cegar/inv-syn/wrapper.v:62$8_Y
(define-fun |wrapper#13| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (ite |wrapper#0| (|wrapper#12| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|) |wrapper#4|)) ;  $techmap\m1.$procmux$18_Y
(define-fun |wrapper#14| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (ite |wrapper#11| #b0000 (|wrapper#13| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|))) ;  $techmap\m1.$0\v[3:0]
(define-fun |wrapper#15| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (bvsub |wrapper#2| #b0001)) ;  $techmap\m1.$auto$wreduce.cc:350:run$26 [3:0]
(define-fun |wrapper#16| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (ite |wrapper#0| (|wrapper#15| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|) |wrapper#2|)) ;  $techmap\m1.$procmux$13_Y
(define-fun |wrapper#17| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) (_ BitVec 4) (ite |wrapper#11| #b1111 (|wrapper#16| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|))) ;  $techmap\m1.$0\imp[3:0]
(define-fun |wrapper_a| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool (|wrapper_a 0| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|))
(define-fun |wrapper_u| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool true)
(define-fun |wrapper_i| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool true)
(define-fun |wrapper_h| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool)) Bool true)
(define-fun |wrapper_t| ((|wrapper_is| Bool) (|wrapper#0| Bool) (|wrapper#1| (_ BitVec 4)) (|wrapper#2| (_ BitVec 4)) (|wrapper#4| (_ BitVec 4)) (|wrapper#8| Bool) (|wrapper#11| Bool) (|wrapper_is_next| Bool) (|wrapper#0_next| Bool) (|wrapper#1_next| (_ BitVec 4)) (|wrapper#2_next| (_ BitVec 4)) (|wrapper#4_next| (_ BitVec 4)) (|wrapper#8_next| Bool) (|wrapper#11_next| Bool)) Bool (and
  (= (|wrapper#14| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|) |wrapper#4_next|) ; $techmap/m1.$procdff$24 \m1.v
  (= (|wrapper#17| |wrapper_is| |wrapper#0| |wrapper#1| |wrapper#2| |wrapper#4| |wrapper#8| |wrapper#11|) |wrapper#2_next|) ; $techmap/m1.$procdff$23 \m1.imp
)) ;  end of module wrapper
; yosys-smt2-topmod wrapper
; end of yosys output


(declare-rel INV (Bool Bool (_ BitVec 4) (_ BitVec 4) (_ BitVec 4) Bool Bool))
(declare-rel fail ())

(declare-var |BI_wrapper_is| Bool)
(declare-var |BI___ILA_I_en| Bool)
(declare-var |BI___ILA_SO_v| (_ BitVec 4))
(declare-var |BI_m1.imp| (_ BitVec 4))
(declare-var |BI_m1.v| (_ BitVec 4))
(declare-var |BI_clk| Bool)
(declare-var |BI_rst| Bool)

(declare-var |I_wrapper_is| Bool)
(declare-var |I___ILA_I_en| Bool)
(declare-var |I___ILA_SO_v| (_ BitVec 4))
(declare-var |I_m1.imp| (_ BitVec 4))
(declare-var |I_m1.v| (_ BitVec 4))
(declare-var |I_clk| Bool)
(declare-var |I_rst| Bool)

;(declare-var |__BI__state| Type)
;(declare-var |__I__state|  Type)

(declare-var |S_wrapper_is| Bool)
(declare-var |S___ILA_I_en| Bool)
(declare-var |S___ILA_SO_v| (_ BitVec 4))
(declare-var |S_m1.imp| (_ BitVec 4))
(declare-var |S_m1.v| (_ BitVec 4))
(declare-var |S_clk| Bool)
(declare-var |S_rst| Bool)

(declare-var |S'_wrapper_is| Bool)
(declare-var |S'___ILA_I_en| Bool)
(declare-var |S'___ILA_SO_v| (_ BitVec 4))
(declare-var |S'_m1.imp| (_ BitVec 4))
(declare-var |S'_m1.v| (_ BitVec 4))
(declare-var |S'_clk| Bool)
(declare-var |S'_rst| Bool)

;(declare-var |__S__state| Type)
;(declare-var |__S'__state| Type)

; same for flattened

; init => inv
(rule (=> (and 
  (|wrapper_n rst| |BI_wrapper_is| |BI___ILA_I_en| |BI___ILA_SO_v| |BI_m1.imp| |BI_m1.v| |BI_clk| |BI_rst|) 
   
  
  (|wrapper_t| |BI_wrapper_is| |BI___ILA_I_en| |BI___ILA_SO_v| |BI_m1.imp| |BI_m1.v| |BI_clk| |BI_rst| |I_wrapper_is| |I___ILA_I_en| |I___ILA_SO_v| |I_m1.imp| |I_m1.v| |I_clk| |I_rst|)) 
  (INV |I_wrapper_is| |I___ILA_I_en| |I___ILA_SO_v| |I_m1.imp| |I_m1.v| |I_clk| |I_rst|)))

; inv /\ T => inv
(rule (=> (and 
  (INV |S_wrapper_is| |S___ILA_I_en| |S___ILA_SO_v| |S_m1.imp| |S_m1.v| |S_clk| |S_rst|) 
  (|wrapper_u| |S_wrapper_is| |S___ILA_I_en| |S___ILA_SO_v| |S_m1.imp| |S_m1.v| |S_clk| |S_rst|) 
  (|wrapper_u| |S'_wrapper_is| |S'___ILA_I_en| |S'___ILA_SO_v| |S'_m1.imp| |S'_m1.v| |S'_clk| |S'_rst|) 
  
  
  (|wrapper_t| |S_wrapper_is| |S___ILA_I_en| |S___ILA_SO_v| |S_m1.imp| |S_m1.v| |S_clk| |S_rst| |S'_wrapper_is| |S'___ILA_I_en| |S'___ILA_SO_v| |S'_m1.imp| |S'_m1.v| |S'_clk| |S'_rst|)) 
  (INV |S'_wrapper_is| |S'___ILA_I_en| |S'___ILA_SO_v| |S'_m1.imp| |S'_m1.v| |S'_clk| |S'_rst|)))

; inv /\ ~p => \bot
(rule (=> (and 
  (INV |S_wrapper_is| |S___ILA_I_en| |S___ILA_SO_v| |S_m1.imp| |S_m1.v| |S_clk| |S_rst|)
  (|wrapper_u| |S_wrapper_is| |S___ILA_I_en| |S___ILA_SO_v| |S_m1.imp| |S_m1.v| |S_clk| |S_rst|) 
  
  (not (|wrapper_a| |S_wrapper_is| |S___ILA_I_en| |S___ILA_SO_v| |S_m1.imp| |S_m1.v| |S_clk| |S_rst|))) 
  fail))

(query fail :print-certificate true)

