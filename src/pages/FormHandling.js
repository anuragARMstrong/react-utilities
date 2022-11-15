import { Link } from 'react-router-dom';
import PageHeader from '../components/PageHeader';

function FormHandling() {
  return (
    <div>
      <PageHeader pageTitle="Form Handling" />
      <p>
        <Link to="/">Back To Home</Link>
      </p>
      <div>Main Div</div>
    </div>
  );
}

export default FormHandling;
