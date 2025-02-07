import React from 'react';
import { Link } from 'react-router-dom';
import Card from '../components/shared/Card';

function AboutPage() {
  return (
    <Card>
      <div className="about">
        <h1>AboutPage</h1>
        <Link to="/">back to home</Link>
      </div>
    </Card>
  );
}

export default AboutPage;
