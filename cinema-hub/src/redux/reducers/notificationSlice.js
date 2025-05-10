import { createSlice } from "@reduxjs/toolkit";
import { addNotificationUser, addViolationFirst, addViolationSecond, countNotiUnRead, updateNotificationUser, viewAllUserNotification, viewNotificationById, viewNotificationUnRead, viewStaffNotification, viewUserNotification } from "../actions/notificationAction";


const initialValue = {
    notification: [],
    notificationId: 0,
    isChange: false,
    isLoading: false,
    isError: false,
    lastNotificationId: 0
}

const notificationSlice = createSlice({
    name: "notification",
    initialState: initialValue,
    reducers: {
        notificationLoading: (state) => {
            state.isLoading = true;
            state.isError = false;
        },
        notificationSuccess: (state, action) => {
            state.isLoading = false;
            state.isError = false;
            state.notification = action.payload;
        },
        notificationFail: (state) => {
            state.isLoading = false;
            state.isError = true;
            state.notificationId = 0;
        },
        notificationId: (state, action) => {
            state.notificationId = action.payload;
            state.isChange = !state.isChange;
        },
        notificationChange: (state) => {
            state.isChange = !state.isChange;
        }
    },
    extraReducers: (builder) => {
        //viewNotificationUnRead
        builder.addCase(viewNotificationUnRead.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewNotificationUnRead.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewNotificationUnRead.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewStaffNotification
        builder.addCase(viewStaffNotification.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewStaffNotification.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastNotificationId = action.payload.data[action.payload.data.length - 1].notificationId;
                state.notification = [...state.notification, ...action.payload.data]; 
            }
        });
        builder.addCase(viewStaffNotification.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewUserNotification
        builder.addCase(viewUserNotification.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewUserNotification.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastNotificationId = action.payload.data[action.payload.data.length - 1].notificationId;
                state.notification = [...state.notification, ...action.payload.data]; 
            }
        });
        builder.addCase(viewUserNotification.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //countNotiUnRead
        builder.addCase(countNotiUnRead.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(countNotiUnRead.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(countNotiUnRead.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewNotificationById
        builder.addCase(viewNotificationById.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewNotificationById.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(viewNotificationById.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //updateNotificationUser
        builder.addCase(updateNotificationUser.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(updateNotificationUser.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(updateNotificationUser.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addNotificationUser
        builder.addCase(addNotificationUser.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addNotificationUser.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(addNotificationUser.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //viewAllUserNotification
        builder.addCase(viewAllUserNotification.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(viewAllUserNotification.fulfilled, (state, action) => {
            state.isLoading = false;
            state.isError = false;
            if (action.payload.data && action.payload.data.length > 0) {
                state.lastNotificationId = action.payload.data[action.payload.data.length - 1].notificationId;
                state.notification = [...state.notification, ...action.payload.data]; 
            }
        });
        builder.addCase(viewAllUserNotification.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addViolationFirst
        builder.addCase(addViolationFirst.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addViolationFirst.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(addViolationFirst.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });

        //addViolationSecond
        builder.addCase(addViolationSecond.pending, (state) => {
            state.isLoading = true;
            state.isError = false;
        });
        builder.addCase(addViolationSecond.fulfilled, (state) => {
            state.isLoading = false;
            state.isError = false;
        });
        builder.addCase(addViolationSecond.rejected, (state) => {
            state.isLoading = false;
            state.isError = true;
        });
    },
});

export const { notificationLoading, notificationSuccess, notificationFail, notificationId, notificationChange } = notificationSlice.actions;
export default notificationSlice.reducer;