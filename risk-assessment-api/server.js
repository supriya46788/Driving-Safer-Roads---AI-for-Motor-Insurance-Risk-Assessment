const express = require('express');
const app = express();
app.use(express.json());

// Risk assessment logic
function calculateRisk({ speed, brake_intensity, acceleration }) {
  let score = 100;

  if (speed > 60) {
    score -= (speed - 60) * 1.2;
  }

  if (brake_intensity > 30) {
    score -= (brake_intensity - 30) * 1.5;
  }

  if (acceleration > 20) {
    score -= (acceleration - 20) * 1.5;
  }

  score = Math.max(0, Math.min(100, Math.round(score)));

  let grade = 'Low';
  if (score < 40) grade = 'High';
  else if (score < 70) grade = 'Moderate';

  return { risk_score: score, risk_grade: grade };
}

// POST /api/risk-assessment
app.post('/api/risk-assessment', (req, res) => {
  const { speed, brake_intensity, acceleration } = req.body;

  if (
    typeof speed !== 'number' ||
    typeof brake_intensity !== 'number' ||
    typeof acceleration !== 'number'
  ) {
    return res.status(400).json({ error: 'Invalid or missing input fields.' });
  }


  const result = calculateRisk({ speed, brake_intensity, acceleration });
  res.json(result);
});
app.get('/', (req, res) => {
  res.send('🚗 Welcome to the Risk Assessment API. Use POST /api/risk-assessment');
});
// Server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚗 Risk Assessment API running at http://localhost:${PORT}`);
});
