import { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import PageHeader from '../components/PageHeader';
import { BsArrowLeft } from 'react-icons/bs';
import { DataGrid } from '@mui/x-data-grid';
import axios from 'axios';

function DataTable() {
  const [columns, setColumns] = useState([]);
  const [rows, setRows] = useState([]);

  useEffect(() => {
    const token = localStorage.getItem('token');
    const fetchReport = async () => {
      try {
        const { data: resp } = await axios({
          url: 'http://43.230.201.16:4456/asrs/api/report/inventory',
          method: 'GET',
          headers: {
            Authorization: 'Bearer ' + token
          }
        });
        const { rows: results } = resp;
        if (results.length > 0) {
          const columns = [];
          const cols = Object.keys(results[0]);
          columns.push({ field: 'id', headerName: 'ID', width: 70 });
          cols.forEach(el => {
            if (el === 'desc') {
              return columns.push({ field: el, headerName: el.toUpperCase(), width: 250 });
            }
            if (el === 'blockedas') {
              return columns.push({ field: el, headerName: el.toUpperCase(), width: 100, sortable: false });
            }
            if (el === 'batch') {
              return columns.push({ field: el, headerName: el.toUpperCase(), width: 200 });
            }
            columns.push({ field: el, headerName: el.toUpperCase(), width: 100 });
          });
          setColumns(columns);
          const finalResults = results.map((result, ind) => ({ ...result, id: ind + 1 }));
          setRows(finalResults);
        }
      } catch (err) {
        console.log(err);
      }
    };
    fetchReport();
  }, []);

  return (
    <div>
      <PageHeader pageTitle="Data Table" />
      <p>
        <Link to="/">
          <BsArrowLeft /> Back To Home
        </Link>
      </p>
      <div style={{ padding: '0 50px', marginTop: '20px' }}>
        {/* {console.log(column)} */}
        {columns && (
          <div style={{ height: 400, width: '100%' }}>
            <DataGrid rows={rows} columns={columns} pageSize={5} rowsPerPageOptions={[5]} checkboxSelection />
          </div>
        )}
      </div>
    </div>
  );
}

export default DataTable;
