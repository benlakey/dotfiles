(:DEBUG 1 1
        ("arithmetic error DIVISION-BY-ZERO signalled
         Operation was /, operands (0 0)."
         "   [Condition of type DIVISION-BY-ZERO]" NIL)
        (("RETRY" "Retry SLIME REPL evaluation request.")
         ("*ABORT" "Return to SLIME's top level.")
         ("ABORT" "abort thread (#<THREAD \"repl-thread\" RUNNING {10059CB2F3}>)"))
        ((0 "(SB-KERNEL::INTEGER-/-INTEGER 0 0)")
         (1 "(/ 0 0)")
         (2 "(SB-INT:SIMPLE-EVAL-IN-LEXENV (/ 0 0) #<NULL-LEXENV>)")
         (3 "(EVAL (/ 0 0))") (4 "(SWANK::EVAL-REGION \"(/ 0 0) ..)" (:RESTARTABLE T))
         (5 "((LAMBDA NIL :IN SWANK-REPL::REPL-EVAL))" (:RESTARTABLE T))
         (6 "(SWANK-REPL::TRACK-PACKAGE #<CLOSURE (LAMBDA NIL :IN SWANK-REPL::REPL-EVAL) {1005FDD6CB}>)" (:RESTARTABLE T))
         (7 "(SWANK::CALL-WITH-RETRY-RESTART \"Retry SLIME REPL evaluation request.\" #<CLOSURE (LAMBDA NIL :IN SWANK-REPL::REPL-EVAL) {1005FDD62B}>)" (:RESTARTABLE T))
         (8 "(SWANK::CALL-WITH-BUFFER-SYNTAX NIL #<CLOSURE (LAMBDA NIL :IN SWANK-REPL::REPL-EVAL) {1005FDD60B}>)" (:RESTARTABLE T))
         (9 "(SWANK-REPL::REPL-EVAL \"(/ 0 0) ..)" (:RESTARTABLE T))
         (10 "asdfasdf")
         (11 "asdfasdf")
         (12 "asdfasdf" (:RESTARTABLE T))
         (13 "(SWANK::PROCESS-REQUESTS NIL)" (:RESTARTABLE T))
         (14 "((LAMBDA NIL :IN SWANK::HANDLE-REQUESTS))" (:RESTARTABLE T))
         (15 "((LAMBDA NIL :IN SWANK::HANDLE-REQUESTS))" (:RESTARTABLE T))
         (16 "asdfasdf")
         (17 "sdfgsdfg")
         (18 "sdfgsdfg" (:RESTARTABLE T))
         (19 "(SWANK::HANDLE-REQUESTS #<SWANK::MULTITHREADED-CONNECTION {1004CD0A53}> NIL)" (:RESTARTABLE T)))
        (7))
