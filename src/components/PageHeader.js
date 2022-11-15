export default function pageHeader({ pageTitle = 'Page' }) {
  return (
    <div>
      <center>
        <h2> {pageTitle.toUpperCase()}</h2>
      </center>
    </div>
  );
}
