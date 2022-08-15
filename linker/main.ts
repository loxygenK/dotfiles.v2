import hoge from "hoge";

export type Props = {
    content: string;
}

export function someThing() {
    // Something
    const dynVal = dyn(123)
        .derive(() => 123);

    return dynVal;
}
