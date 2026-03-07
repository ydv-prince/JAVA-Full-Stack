<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #36b9cc, #1cc88a);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .payment-container {
            max-width: 500px;
            margin: 80px auto;
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .payment-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-pay {
            width: 100%;
        }
        .course-price {
            font-size: 1.3rem;
            font-weight: 600;
        }
        .btn-back {
            margin-bottom: 20px;
        }
    </style>
    <script>
        function goBack() {
            // Redirect to dashboard
            window.location.href = '<%=request.getContextPath()%>/student';
        }

        function makePayment() {
            // Simulate payment success
            alert('Payment successful! 🎉');
            // Redirect to My Courses
            window.location.href = '<%=request.getContextPath()%>/student/courses';
        }
    </script>
</head>
<body>
<div class="payment-container">
    <!-- Back Button -->
    <button class="btn btn-secondary btn-back" onclick="goBack()">← Back to Dashboard</button>

    <div class="payment-header">
        <h3>Course Payment</h3>
        <p class="text-muted">Complete your enrollment</p>
    </div>

    <div class="mb-3">
        <label class="form-label"><strong>Course:</strong></label>
        <p>Java Web Development</p>
    </div>

    <div class="mb-3">
        <label class="form-label"><strong>Price:</strong></label>
        <p class="course-price">₹9999</p>
    </div>

    <div class="mb-3">
        <label for="paymentMethod" class="form-label"><strong>Select Payment Method</strong></label>
        <select class="form-select" id="paymentMethod">
            <option value="">--Choose--</option>
            <option value="credit_card">Credit Card</option>
            <option value="debit_card">Debit Card</option>
            <option value="paypal">UPI</option>
            <option value="net_banking">Net Banking</option>
        </select>
    </div>

    <button class="btn btn-success btn-pay" onclick="makePayment()">Pay ₹9999</button>

    <div class="text-center mt-3 text-muted">
        <small>Your payment is secure and encrypted.</small>
    </div>
</div>
</body>
</html>