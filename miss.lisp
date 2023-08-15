(format t "MISSIONARIES AND CANNIBALS PROBLEM")
(terpri)
;Below is the traverse function which is used to transfer/move the missionaries and cannibals from left river bank to the right river bank.
;The varibales are being assigned for following operations,
;missionaries initial state traverse
;cannibals initial state traverse
;missionaries count
;cannibals count
;missionaries goal state traverse
;cannibals goal state traverse 
(defun traverse(traverse_m traverse_c m c traverseg_m traverseg_c)
  (terpri)
  (format t "~s  ~s ------ ~s, ~s -----> ~s  ~s" traverse_m traverse_c m c traverseg_m traverseg_c))
;Below is the traverse verso function whic is used to trnsfer/move the missionaries and cannibals from right river bank to left river bank in reverse order.
(defun traverse_verso(traverse_m traverse_c m c traverseg_m traverseg_c)
  (terpri)
  (format t "~s  ~s <----- ~s, ~s ------ ~s  ~s" traverse_m traverse_c m c traverseg_m traverseg_c))
;Below is the main heart of the program io order to move m
(defun mandc_solve()
  ;;Let us assume that Missionaries are considered 'X'
  ;;and Cannibals are considered to be 'Y' from now on.

  (princ "Enter the total number of Missionaries and Cannibals follwed by boat size:")
  (terpri)
  (setf mcInput (read)); to store the input for number of missionaries and cannibals from user end. 
  (setf bCapacity 6); capacity of the boat.
  (setf initY mcInput initX mcInput); set the values of missionaries and cannibals to initY and initX varibles.
  (setf targetY 0 targetX 0); set the values of desired states for X and Y. 
  (setf bY 0 bX 0);set value for boat state.
  (princ "InitState   BoatSize  GoalState")
  (terpri)
  (princ "M   C         M  C       M   C")
  (terpri)
  (format t "~s  ~s                    ~s  ~s" initX initY targetX targetY)
  ; The initial set of Y are being traversed.
  ; incremenet/decrement the init state and target state of every X and Y. 
  (incf bY bCapacity)
  (decf initY bCapacity)
  (traverse initX initY bX bY targetX targetY)
  (incf targetY (- bY 1))
  (decf bY targetY)
  (traverse_verso initX initY bX bY targetX targetY)
  (incf bX (- bCapacity bY))
  (decf initX (- bCapacity bY))
  (traverse initX initY bX bY targetX targetY)
  (incf targetX bX)
  (decf bX targetX)
  (traverse_verso initX initY bX bY targetX targetY)
  ; Completed with commencing of the problem.  
  
  (if (eq (mod bCapacity 2) 0); If at all the boat size is odd make it even number of X's.
    (progn
      (setq countM (/ bCapacity 2) countC (/ bCapacity 2)))
    (progn
      (setq countM (/ (- bCapacity (mod bCapacity 2)) 2) countC (/ (- bCapacity (mod bCapacity 2)) 2))))
    ; loop while there are more missionaries than cannibals If at all there are more X than Y
  (loop while (> initX (- bCapacity 1))
    do
      (incf bX countM)
      (incf bY (- countC bY))
      (decf initX bX)
      (decf initY (- countC 1)) (traverse initX initY bX bY targetX targetY)
      (incf targetY (- bY 1))
      (incf targetX bX)
      (decf bY (- bY 1))
      (decf bX bX) (traverse_verso initX initY bX bY targetX targetY)
      (if (> initX (- bCapacity 1))
        (progn
          (incf bY 1) ; to balance the Y's perform traverse.
          (decf initY 1) (traverse initX initY bX bY targetX targetY)
          (incf targetY (- bY 1))
          (decf bY (- bY 1)) (traverse_verso initX initY bX bY targetX targetY))
        (progn
          (incf bX initX)
          (decf initX bX) (traverse initX initY bX bY targetX targetY)
          (incf targetX bX)
          (decf bX bX) (traverse_verso initX initY bX bY targetX targetY))))
  (if (> initX 0); When inital state of X is greater than 0 increment/decrement and traverse.
    (progn
      (incf bX initX)
      (decf initX bX)
      (traverse initX initY bX bY targetX targetY)
      (incf targetX bX)
      (decf bX bX)
      (traverse_verso initX initY bX bY targetX targetY))
    nil)
  (incf bY initY); The left over Y's will be traversed.
  (decf initY (- bY 1))
  (traverse initX initY bX bY targetX targetY); The final traverse by when all the X's and Y's are beign moved from left to right.
  (incf targetY bY)
  (setf bY 0)
  (terpri)
  (format t "~s  ~s ******* FINISH ****** ~s  ~s" initX initY targetX targetY))

(defun begin(); The begin function is used to initiate the mandc_slove fucntion.
    (mandc_solve)
   )
(begin)