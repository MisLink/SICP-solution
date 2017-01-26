#lang planet neil/sicp

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (empty-queue?)
      (null? front-ptr))
    (define (insert-queue! item)
      (let ((new (cons item '())))
        (if (empty-queue?)
            (begin
              (set! front-ptr new)
              (set! rear-ptr new))
            (begin
              (set-cdr! rear-ptr new)
              (set! rear-ptr new)))
        front-ptr))
    (define (delete-queue!)
      (if (empty-queue?)
          (error "empty queue")
          (set! front-ptr (cdr front-ptr)))
      front-ptr)
    (define (dispatch m)
      (cond ((eq? m 'insert-queue!)
             insert-queue!)
            ((eq? m 'delete-queue!)
             delete-queue!)
            ((eq? m 'empty-queue?)
             empty-queue?)))
    dispatch))

(define q (make-queue))
((q 'insert-queue!) 'a)
((q 'insert-queue!) 'b)
((q 'insert-queue!) 'c)
((q 'delete-queue!))
((q 'delete-queue!))
((q 'delete-queue!))
