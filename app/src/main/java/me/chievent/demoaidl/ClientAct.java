package me.chievent.demoaidl;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;

import java.util.List;

public class ClientAct extends AppCompatActivity {

    private int mCount;
    private IBookManager mIBookManager;

    private IBookCallback mBookCallback = new IBookCallback.Stub() {

        @Override
        public void onBookAdded(Book book) throws RemoteException {
            Log.d("DemoAIDL", "ClientAct, onBookAdded");
        }
    };

    private ServiceConnection mServiceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            mIBookManager = IBookManager.Stub.asInterface(iBinder);
            try {
                mIBookManager.registerListener(mBookCallback);
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.d("DemoAIDL", "ClientAct", e);
                return;
            }
            Log.d("DemoAIDL", "ClientAct, onServiceConnected");
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            mIBookManager = null;
            Log.d("DemoAIDL", "ClientAct, onServiceDisconnected");
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bindService(new Intent(this, RemoteService.class), mServiceConnection, Context.BIND_AUTO_CREATE);
    }


    public void doAddBook(View view) {
        if (mIBookManager != null) {
            try {
                mCount++;
                mIBookManager.addBook(new Book(mCount, "Book: " + mCount));
                Log.d("DemoAIDL", "ClientAct, doAddBook success");
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.d("DemoAIDL", "ClientAct, doAddBook", e);
            }
        } else {
            Log.d("DemoAIDL", "ClientAct, mIBookManager is null");
        }
    }

    public void doGetBookList(View view) {
        if (mIBookManager != null) {
            try {
                List<Book> books = mIBookManager.getBookList();
                Log.d("DemoAIDL", "ClientAct, doGetBookList success");
            } catch (RemoteException e) {
                e.printStackTrace();
                Log.d("DemoAIDL", "ClientAct, doGetBookList", e);
            }
        } else {
            Log.d("DemoAIDL", "ClientAct, mIBookManager is null, 2");
        }
    }
}
