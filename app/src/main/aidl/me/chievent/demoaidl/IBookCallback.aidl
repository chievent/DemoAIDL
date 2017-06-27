// IBookCallback.aidl
package me.chievent.demoaidl;

import me.chievent.demoaidl.Book;

interface IBookCallback {
    void onBookAdded(in Book book);
}
