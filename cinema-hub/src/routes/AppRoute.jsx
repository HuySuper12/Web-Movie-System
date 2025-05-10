import { createBrowserRouter, RouterProvider } from "react-router-dom";

import NotFound from "./NotFound";
import HomePage from "../pages-user/home-page";
import PolicyPage from "../pages-user/policies-page";
import Contact from "../pages-user/contact-page";
import ServicePackage from "../pages-user/service-package-page";
import Login from "../pages-user/login-page";
import Register from "../pages-user/register-page";
import MoviesList from "../pages-user/movie-list-page";
import MovieDetail from "../pages-user/movie-detail-page";
import ProfilePage from "../pages-user/profile-account-page";
import ForgotPassword from "../pages-user/forgot-password-page";
import HomePageAdmin from "../pages-admin/home-page";
import AccountAdmin from "../pages-admin/account-manage-page";
import MovieGerneAdmin from "../pages-admin/movie-genre-manage-page";
import MovieAdmin from "../pages-admin/movie-manage-page";
import WishList from "../pages-user/wishlist-page";
import WatchHistory from "../pages-user/watch-history-page";
import ProfileAdmin from "../pages-admin/profile-admin-page";
import ViewRatingAdmin from "../pages-admin/view-rating-manage-page";
import Notification from "../pages-user/notification-page";
import NotificationAdmin from "../pages-admin/notification-manage-page";
import CommentRatingDetail from "../pages-user/comment-rating-page";
import CommentAdmin from "../pages-admin/comment-manage-page";
import TransactionSuccess from "../pages-user/transaction-page/success";
import TransactionFail from "../pages-user/transaction-page/fail";
import SubscriptionPlanAdmin from "../pages-admin/subscription-plan-page";
import PaymentHistory from "../pages-user/payment-history-page";
import PaymentAdmin from "../pages-admin/payment-manage-page";

function AppRoute() {
  const router = createBrowserRouter([
    {
      element: <HomePage />,
      path: "/",
    },
    {
      element: <MoviesList />,
      path: "/movie-list",
    },
    {
      element: <MovieDetail />,
      path: "/movie-detail",
    },
    {
      element: <PolicyPage />,
      path: "/policies",
    },
    {
      element: <Contact />,
      path: "/contact",
    },
    {
      element: <ServicePackage />,
      path: "/servicePackage",
    },
    {
      element: <Login />,
      path: "/login",
    },
    {
      element: <Register />,
      path: "/register",
    },
    {
      element: <ForgotPassword />,
      path: "/forgot-password",
    },
    {
      element: <ProfilePage />,
      path: "/profile",
    },
    {
      element: <WishList />,
      path: "/wish-list",
    },
    {
      element: <WatchHistory />,
      path: "/watch-history",
    },
    {
      element: <Notification />,
      path: "/notification",
    },
    {
      element: <CommentRatingDetail />,
      path: "/comment-rating",
    },
    {
      element: <TransactionSuccess />,
      path: "/transaction-success",
    },
    {
      element: <TransactionFail />,
      path: "/transaction-fail",
    },
    {
      element: <PaymentHistory />,
      path: "/payment-history",
    },
    {
      element: <NotFound />,
      path: "*",
    },
    {
      element: <HomePageAdmin />,
      path: "/admin",
    },
    {
      element: <AccountAdmin />,
      path: "/account-admin",
    },
    {
      element: <MovieGerneAdmin />,
      path: "/movie-genre-admin",
    },
    {
      element: <MovieAdmin />,
      path: "/movie-admin",
    },
    {
      element: <ProfileAdmin />,
      path: "/profile-admin",
    },
    {
      element: <ViewRatingAdmin />,
      path: "/view-rating-admin",
    },
    {
      element: <CommentAdmin />,
      path: "/comment-admin",
    },
    {
      element: <NotificationAdmin />,
      path: "/notification-admin",
    },
    {
      element: <SubscriptionPlanAdmin />,
      path: "/subscription-plan-admin",
    },
    {
      element: <PaymentAdmin />,
      path: "/payment-admin",
    },
  ]);

  return <RouterProvider router={router} />;
}

export default AppRoute;
