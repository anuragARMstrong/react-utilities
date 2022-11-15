import { Link } from 'react-router-dom';
import PageHeader from '../components/PageHeader';
import { BsTable, BsUiChecks, BsFileSlides, BsMap } from 'react-icons/bs';

function Home() {
  return (
    <div>
      {/* <h2>Home Page</h2> */}
      <PageHeader pageTitle="HOME PAGE" />
      <div style={{ width: '500px' }}>
        <ul>
          <li>
            <Link to="/data-table">
              <BsTable /> DATA TABLE
            </Link>
          </li>
          <li>
            <Link to="/forms">
              <BsUiChecks /> FORM HANDLING
            </Link>
          </li>
          <li>
            <Link to="/slider">
              <BsFileSlides />
              SLIDER EXAMPLE
            </Link>
          </li>
          <li>
            <Link to="/map">
              <BsMap /> MAP EXAMPLE
            </Link>
          </li>
        </ul>
      </div>
    </div>
  );
}

export default Home;
