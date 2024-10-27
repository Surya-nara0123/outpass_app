// routes.js
import UserSignin from './src/components/UserSignin'
import Home from './src/Home/home';

const routes = [
  {
    path: '/',
    element: <UserSignin />,
  },
  {
    path: '/home',
    element: <Home />
  }
];

export default routes;