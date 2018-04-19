; (null-ld? obj)
(define (null-ld? obj)
  (if (not (pair? obj))
      #f
      (eq? (car obj) (cdr obj))))

; (ld? obj)
(define (ld? obj)
  (cond
    ((null-ld? obj) #t)
    ((not (pair? obj)) #f)
    (else (let ((tail (cdr obj)))
            (let islistdiff? ((curlist (car obj)))
              (cond
                ((null? curlist) #f)
                ((not (pair? curlist)) (eq? curlist tail))
                ((eq? curlist tail) #t)
                (else (islistdiff? (cdr curlist)))))))))

; (cons-ld obj listdiff)
(define (cons-ld obj listdiff)
  (cons (cons obj (car listdiff)) (cdr listdiff)))

; (car-ld listdiff)
(define (car-ld listdiff)
  (cond
    ((null-ld? listdiff) "error")
    ((listdiff? listdiff) (car (car listdiff)))
    (else "error")))

; (cdr-ld listdiff)
(define (cdr-ld listdiff)
  (cond
    ((null-ld? listdiff) "error")
    ((listdiff? listdiff) (cons (cdr (car listdiff)) (cdr listdiff)))
    (else "error")))

; (ld obj ...)
(define (ld obj . arg)
  (let ((newobj (list obj)))
    (let ((newlist (append (cons obj arg) newobj)))
      (cons newlist newobj))))

; (length-ld listdiff)
(define (length-ld listdiff)
  (if (not (listdiff? listdiff))
      "error"
      (let ((tail (cdr listdiff)))
        (let count-length ((curlist (car listdiff)))
          (cond
            ((eq? curlist tail) 0)
            (else (+ 1 (count-length (cdr curlist)))))))))

; (append-ld listdiff)
(define (append-ld listdiff)
  (if (null? arg)
      listdiff   
      (let generate-objs ((curlist (cons listdiff arg)))
        (cond
          ((null? (cdr curlist)) (car curlist))
          (else (let cons-obj ((curldiff (listdiff->list (car curlist))))
                  (if (null? curldiff)
                      (generate-objs (cdr curlist))
                      (cons-ld (car curldiff) (cons-obj (cdr curldiff))))))))))

; (ld-tail listdiff k)
(define (ld-tail listdiff k)())

; (list->ld list)
(define (list->ld list)
  (cond
    ((not (pair? list)) "error")
    ((null? list) (cons list list))
    (else (let ((first-element (cons (car list) null)))
            (cons (append list first-element) first-element)))))

; (ld->list listdiff)
(define (ld->list listdiff)
  (cond
    ((null-ld? listdiff) null)
    ((not (listdiff? listdiff)) "error")
    (else (let ((tail (cdr listdiff)))
            (let generate-list ((curlist (car listdiff)))
              (if (eq? tail curlist)
                  null
                  (cons (car curlist) (generate-list (cdr curlist)))))))))

; (map-ld proc listdiff1 listdiff2 ...)
(define (map-ld proc listdiff1 listdiff2 ...)())

; (expr2ld expr)
(define (expr2ld expr)())
