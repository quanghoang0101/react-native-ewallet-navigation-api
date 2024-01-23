/*
 * Copyright 2020 Walmart Labs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.ewalletnavigation.ern.model;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.util.List;

import com.walmartlabs.electrode.reactnative.bridge.Bridgeable;

import static com.walmartlabs.electrode.reactnative.bridge.util.BridgeArguments.*;

public class NavBar implements Parcelable, Bridgeable {
    public static final Creator<NavBar> CREATOR =
            new Creator<NavBar>() {
                @Override
                public NavBar createFromParcel(Parcel in) {
                    return new NavBar(in);
                }

                @Override
                public NavBar[] newArray(int size) {
                    return new NavBar[size];
                }
            };

    private String title;
    private List<NavBarButton> buttons;

    private NavBar() {
    }

    private NavBar(Builder builder) {
        this.title = builder.title;
        this.buttons = builder.buttons;
    }

    private NavBar(Parcel in) {
        this(in.readBundle());
    }

    public NavBar(@NonNull Bundle bundle) {
        if (!bundle.containsKey("title")) {
            throw new IllegalArgumentException("title property is required");
        }

        this.title = bundle.getString("title");
        this.buttons = bundle.containsKey("buttons") ? getList(bundle.getParcelableArray("buttons"), NavBarButton.class) : null;
    }

    /**
     * Title of Nav Bar
     *
     * @return String
     */
    @NonNull
    public String getTitle() {
        return title;
    }

    /**
     * Right button properties
     *
     * @return List<NavBarButton>
     */
    @Nullable
    public List<NavBarButton> getButtons() {
        return buttons;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeBundle(toBundle());
    }

    @NonNull
    @Override
    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString("title", this.title);
        if (this.buttons != null) {
            updateBundleWithList(this.buttons, bundle, "buttons");
        }
        return bundle;
    }

    @Override
    public String toString() {
        return "{"
                + "title:" + (title != null ? "\"" + title + "\"" : null) + ","
                + "buttons:" + (buttons != null ? buttons.toString() : null)
                + "}";
    }

    public static class Builder {
        private final String title;
        private List<NavBarButton> buttons;

        public Builder(@NonNull String title) {
            this.title = title;
        }

        @NonNull
        public Builder buttons(@Nullable List<NavBarButton> buttons) {
            this.buttons = buttons;
            return this;
        }

        @NonNull
        public NavBar build() {
            return new NavBar(this);
        }
    }
}
