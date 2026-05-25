;; title: stacks-spend-guard
;; version: 0.1.0
;; summary: Non-custodial monthly spend-limit and receipt tracking proof.
;; description: Developer proof for payment-safety activity on Stacks. The contract
;; does not custody, transfer, or approve funds.

;; traits
;;

;; token definitions
;;

;; constants
;;

(define-constant ERR_INVALID_MONTH (err u100))
(define-constant ERR_INVALID_AMOUNT (err u101))
(define-constant ERR_LIMIT_NOT_SET (err u102))
(define-constant ERR_MONTHLY_LIMIT_EXCEEDED (err u103))

;; data vars
;;

;; data maps
;;

(define-map monthly-limits
  { user: principal, month: uint }
  { limit: uint }
)

(define-map month-states
  { user: principal, month: uint }
  { spent: uint, receipt-count: uint }
)

;; public functions
;;

(define-public (set-monthly-limit (month uint) (limit uint))
  (begin
    (asserts! (> month u0) ERR_INVALID_MONTH)
    (asserts! (> limit u0) ERR_INVALID_AMOUNT)
    (map-set monthly-limits
      { user: tx-sender, month: month }
      { limit: limit }
    )
    (ok { user: tx-sender, month: month, limit: limit })
  )
)

(define-public (record-spend (month uint) (amount uint) (merchant (string-ascii 64)))
  (let
    (
      (limit-row (unwrap! (map-get? monthly-limits { user: tx-sender, month: month }) ERR_LIMIT_NOT_SET))
      (state-row (default-to { spent: u0, receipt-count: u0 } (map-get? month-states { user: tx-sender, month: month })))
      (new-spent (+ (get spent state-row) amount))
      (new-count (+ (get receipt-count state-row) u1))
    )
    (begin
      (asserts! (> month u0) ERR_INVALID_MONTH)
      (asserts! (> amount u0) ERR_INVALID_AMOUNT)
      (asserts! (<= new-spent (get limit limit-row)) ERR_MONTHLY_LIMIT_EXCEEDED)
      (map-set month-states
        { user: tx-sender, month: month }
        { spent: new-spent, receipt-count: new-count }
      )
      (ok {
        user: tx-sender,
        month: month,
        amount: amount,
        merchant: merchant,
        spent: new-spent,
        remaining: (- (get limit limit-row) new-spent),
        receipt-count: new-count
      })
    )
  )
)

;; read only functions
;;

(define-read-only (get-monthly-limit (user principal) (month uint))
  (map-get? monthly-limits { user: user, month: month })
)

(define-read-only (get-month-state (user principal) (month uint))
  (default-to { spent: u0, receipt-count: u0 } (map-get? month-states { user: user, month: month }))
)

(define-read-only (get-remaining-limit (user principal) (month uint))
  (match (map-get? monthly-limits { user: user, month: month })
    limit-row
      (let
        (
          (state-row (default-to { spent: u0, receipt-count: u0 } (map-get? month-states { user: user, month: month })))
        )
        (some (- (get limit limit-row) (get spent state-row)))
      )
    none
  )
)

;; private functions
;;
